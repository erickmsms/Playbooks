# Playbooks - GCP

Este diretório contém guias práticos, scripts de automação e documentação técnica para implementação de pipelines de dados no Google Cloud Platform (GCP), com foco em **ingestão**, **transformação** e **estimativa de custos**.

---

## 📁 Estrutura da Pasta

```
Playbooks - GCP/
├── README.md                             # Este arquivo
├── GCP - Cloud Run Jobs.pdf               # Guia completo de ingestão com Cloud Run Jobs
├── GCP - Estimativa Custos.pdf            # Metodologia para estimar custos em projetos GCP
├── Script Deploy Bronze/                   # Pipeline de ingestão (camada Bronze)
│   ├── Dockerfile
│   └── deploybronze.sh
└── Script Deploy DBT/                      # Pipeline de transformação com DBT
    ├── .dockerignore
    ├── Dockerfile
    ├── deploydbt.sh
    ├── entrypoint.sh
    └── profiles.yml
```

---

## 📘 Documentação Técnica

### 1. `GCP - Cloud Run Jobs.pdf`
Guia passo a passo para implementar **pipelines de ingestão recorrente** usando:
- Cloud Run Jobs
- Cloud Storage (particionamento por data)
- BigQuery (External Tables)
- Agendamento com Scheduler

Inclui desde a estrutura do projeto até deploy e carga histórica.

### 2. `GCP - Estimativa Custos.pdf`
Metodologia padronizada para estimar custos de infraestrutura GCP em projetos de dados. Aborda:
- Dimensionamento de Cloud Storage, BigQuery e Cloud Run
- Tabelas de referência por tipo de fonte
- Cálculo de volume mensal e histórico
- Rateio de custos por fonte

---

## ⚙️ Scripts de Automação

### 🔹 `Script Deploy Bronze/`
Automação para deploy de **pipelines de ingestão (camada Bronze)**.

**Arquivos:**
- `Dockerfile`: Empacota o script de coleta (espera-se um `main.py` no contexto do build)
- `deploybronze.sh`: Script que:
  - Cria/verifica repositório no Artifact Registry
  - Builda e faz push da imagem Docker
  - Cria ou atualiza o Cloud Run Job

**Como usar:**
```bash
cd "Script Deploy Bronze"
# Ajuste as variáveis no script (PROJECT_ID, REGION, etc.)
./deploybronze.sh
```

### 🔹 `Script Deploy DBT/`
Automação para deploy de **pipelines de transformação com DBT**.

**Arquivos:**
- `Dockerfile`: Imagem com DBT + entrypoint
- `.dockerignore`: Arquivos ignorados no build
- `entrypoint.sh`: Script de entrada que executa `dbt run`, `test`, `build`, etc.
- `profiles.yml`: Configuração de conexão com BigQuery
- `deploydbt.sh`: Script de deploy similar ao anterior, mas específico para DBT

---

## 🚀 Como começar

1. **Leia os PDFs** para entender os conceitos e boas práticas
2. **Escolha o tipo de pipeline** que precisa implementar:
   - Ingestão → vá para `Script Deploy Bronze/`
   - Transformação com DBT → vá para `Script Deploy DBT/`
3. **Adapte os scripts** com seus parâmetros (project-id, região, nome da imagem)
4. **Execute o deploy** e acompanhe os logs no Cloud Run

---

## ✅ Pré-requisitos comuns

- Google Cloud SDK instalado e configurado
- Docker instalado
- Permissões no GCP para:
  - Artifact Registry (criar repositórios, push de imagens)
  - Cloud Run (criar/atualizar jobs)
  - BigQuery e Cloud Storage (quando aplicável)

---

## 📌 Observações

- Os scripts são **idempotentes**: podem ser executados múltiplas vezes
- Sempre revise as variáveis antes de executar
- Para ambientes reais, considere usar **variáveis de ambiente ou secrets** no lugar de valores fixos nos scripts

```