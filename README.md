# Synesis, mapeamento eleitoral v0.1

Pacote preliminar do projeto Synesis do mapeamento sistemático da literatura sobre organização do conhecimento para desinformação e outros conteúdos nocivos no contexto eleitoral. Contrato T/O aprovado e piloto corrigido de anotação aprovados por Diego em 2026-09-30, com codificação preliminar em lotes autorizada. Os 88 registros bibliográficos estão materializados como SOURCE; todos permanecem `elegibilidade: pendente`. Há 13 ITEMs preliminares, todos com `status_revisao: proposta_ia`, sete dimensões de codificação e nenhuma chain. Ratificação de elegibilidade, inclusão, exclusão e conclusões continuam sob decisão humana.

Este repositório guarda apenas a camada formal de rastreabilidade (SOURCE, ITEM, ONTOLOGY). PDFs, índices de texto integral, caches e fichamentos de apoio ficam fora do pacote, no projeto de revisão.

## Conteúdo e limites

`anotacoes/` contém 88 SOURCEs, cada um no mesmo `.syn` em que está seu ITEM quando aplicável. Os 13 ITEMs estão distribuídos em 11 arquivos (ELE00012, ELE00014, ELE00015, ELE00016, ELE00017, ELE00018, ELE00019, ELE00029, ELE00035, ELE00037 e ELE00065). Fonte canônica bibliográfica: `dados/deduplicação com R/resultados/execucao_20260929_180537/02_resultados_deduplicados.csv`; proveniência da aquisição: `dados/aquisicao_pdfs/manifesto_downloads.csv`. `referencias.bib` é derivação mecânica compatível do BibTeX canônico `06_resultados_deduplicados.bib`; os artefatos canônicos não foram alterados. Esses caminhos são relativos ao projeto de revisão e estão fora deste repositório. IDs bibliográficos vão de `eleitoral00001` a `eleitoral00088`.

Não se presume tipo documental a partir de `bib_type`. Campos de tipo e idioma só são preenchidos conforme os metadados deduplicados; lacunas ficam ausentes. Natureza do texto segue o manifesto: identidade pendente para ELE00007, sem texto integral local para 14 registros, e PDFs derivados identificados como tais. Elegibilidade não é inferida da disponibilidade do PDF. Hashes e nomes de arquivo são portáveis; caminhos locais do manifesto não são copiados para os SOURCEs.

Não incluir PDFs, índices/caches de texto integral, credenciais, caminhos pessoais ou resultados intermediários no pacote público. Citações curtas são atribuídas e destinadas à finalidade acadêmica; direitos dos artigos permanecem com terceiros. Nenhuma licença do código ou do pacote relicencia esses conteúdos.

## Estrutura do repositório

```
mapeamento_eleitoral.synp   manifesto do projeto (INCLUDE ANNOTATIONS, fontes e políticas)
template.synt               contrato T/O (campos, enums e estados permitidos)
ontologia/conceitos.syno    sete dimensões de codificação dedutiva (QP1 a QP7)
anotacoes/ELE000NN.syn      88 registros SOURCE e seus ITEMs, quando aplicável
referencias.bib             derivação mecânica do BibTeX canônico (88 chaves)
exportacoes/compilado.json  JSON de compilação, derivado e regenerável
validar.sh                  compilação e asserções de integridade
```

## Requisitos

- Synesis CLI 0.11.0 (ou versão compatível): https://github.com/synesis-lang/synesis
- Python 3
- shell POSIX (`validar.sh`)

## Validar e compilar

Na raiz deste diretório execute `./validar.sh`. O script roda `synesis compile` com estatísticas e JSON e depois confere, via Python: 88 arquivos SOURCE, 88 registros `SOURCE @eleitoral...`, 88 campos `elegibilidade: pendente`, ITEMs com IDs únicos, todos `status_revisao: proposta_ia`, nenhum ITEM com elegibilidade ratificada, presença de citação literal (`quote`) nos três pilotos (ELE00016, ELE00035 e ELE00065) e 88 chaves BibTeX distintas em `referencias.bib`.

Compilação verificada com Synesis 0.11.0 em 2026-09-30: 88 Sources, 13 Items, 7 Ontologies/Codes e 0 Chains. Avisos de SOURCE sem ITEM são esperados para os 77 registros ainda não codificados. O JSON de compilação é derivado, contém timestamp e deve ser regenerado a cada execução.

## Estado de revisão e limites metodológicos

O documento `../artefatos/piloto de anotação Synesis v0.1.md` apresenta revisão mecânica, não humana. A aprovação de 2026-09-30 autoriza codificação preliminar em lotes, mas não atribui qualidade final, elegibilidade ratificada nem conclusões do campo. Evidência preliminar não deve ser contada como resultado de corpus incluído. Não exportar OWL ou GraphRAG, ainda não aprovados.

## Como citar

GOUART, Diego Amorim. Synesis, mapeamento eleitoral v0.1: projeto de ontologia do mapeamento sistemático do domínio eleitoral. 2026. Repositório GitHub. Disponível em: https://github.com/diegoamrg4123/revisao-literatura-ontologia-eleitoral. Acesso em: [data].

## Licença

Todos os direitos reservados. A única permissão concedida é citar ou mencionar este repositório com referência completa, conforme `LICENSE.md`. Reprodução, distribuição, derivação, uso comercial ou incorporação em outros conjuntos de dados, sistemas ou modelos exigem autorização prévia por escrito do autor. Os direitos dos artigos referenciados permanecem com seus autores e editoras.

## Publicação

Publicado em https://github.com/diegoamrg4123/revisao-literatura-ontologia-eleitoral por decisão explícita de Diego, mantidos os limites acima: sem PDFs, índices ou caches de texto integral, sem credenciais e sem caminhos pessoais. O trabalho local no projeto de revisão permanece a fonte canônica; este repositório é a projeção pública versionada do subprojeto Synesis.
