#!/bin/sh
set -eu
cd "$(dirname "$0")"
synesis --version
synesis compile mapeamento_eleitoral.synp --stats --json exportacoes/compilado.json
python3 - <<'PY'
import json, re
from pathlib import Path
root = Path('.')
obj = json.loads((root / 'exportacoes/compilado.json').read_text(encoding='utf-8'))
files = sorted((root / 'anotacoes').glob('ELE*.syn'))
assert len(files) == 88, f"esperados 88 arquivos SOURCE, obtidos {len(files)}"
text = '\n'.join(f.read_text(encoding='utf-8') for f in files)
assert len(re.findall(r'^SOURCE @eleitoral\d{5}$', text, re.M)) == 88
assert len(re.findall(r'^    elegibilidade: pendente$', text, re.M)) == 88
items = re.findall(r'^ITEM @eleitoral\d{5}$', text, re.M)
ids = re.findall(r'^    id_item: (.+)$', text, re.M)
assert len(items) >= 3 and len(ids) == len(items) and len(set(ids)) == len(ids)
assert len(re.findall(r'^    status_revisao: proposta_ia$', text, re.M)) == len(items)
assert not re.search(r'^    elegibilidade: (incluido|excluido)$', text, re.M)
for id in ('ELE00016','ELE00035','ELE00065'):
    item = (root/'anotacoes'/f'{id}.syn').read_text(encoding='utf-8')
    assert 'status_revisao: proposta_ia' in item, id
    assert 'elegibilidade: pendente' in item, id
    assert re.search(r'^    quote: .+', item, re.M), id
# Confirm output is valid JSON and bibliographic derivation has 88 distinct IDs.
bib = (root/'referencias.bib').read_text(encoding='utf-8')
keys = re.findall(r'@\w+\{(eleitoral\d{5}),', bib)
assert len(keys) == 88 and len(set(keys)) == 88, f"chaves BibTeX: {len(keys)}"
assert set(keys) == {f'eleitoral{i:05d}' for i in range(1,89)}
print(f'ASSERTS OK: 88 SOURCEs pendentes, {len(items)} ITEMs proposta_ia com IDs únicos, 88 chaves BibTeX; JSON válido')
print('JSON bytes:', (root/'exportacoes/compilado.json').stat().st_size)
PY
