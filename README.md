
---

## 🧭 Como usar este repositório

### 📘 Para aprender e consultar

Os diretórios `Playbooks - DBT` e `Playbooks - GCP` contêm materiais em PDF com:

- **Fundamentos técnicos**
- **Boas práticas de modelagem e operação**
- **Passo a passo executável para implementação**

Use esses materiais como referência para alinhar o time, treinar novos membros ou validar decisões de arquitetura.

### ⚙️ Para executar e automatizar

Os diretórios `Script Deploy Bronze` e `Script Deploy DBT` contêm **exemplos reais de automação** de deploy no GCP, incluindo:

- Scripts shell (`deploy*.sh`) para build, push e atualização de Cloud Run Jobs
- Dockerfiles personalizados
- Arquivos de configuração (`profiles.yml`, `entrypoint.sh`)
- READMEs explicativos com instruções de uso

> 💡 Basta ajustar as variáveis (nome da imagem, projeto, região) e executar o script correspondente.

---

## 🎯 Público-alvo

- Engenheiros de Dados
- Analytics Engineers
- Arquiteto de Soluções GCP
- Times que utilizam **BigQuery**, **Cloud Run** e **DBT** em produção

---

## 🚀 Comece por aqui

Se você quer:

- **Implementar um pipeline de ingestão** → vá para [`Playbooks - GCP/Script Deploy Bronze/`](./Playbooks%20-%20GCP/Script%20Deploy%20Bronze)
- **Criar um pipeline de transformação com DBT** → vá para [`Playbooks - GCP/Script Deploy DBT/`](./Playbooks%20-%20GCP/Script%20Deploy%20DBT)
- **Estimar custos de um projeto no GCP** → leia o [`GCP - Estimativa Custos.pdf`](./Playbooks%20-%20GCP/GCP%20-%20Estimativa%20Custos.pdf)
- **Entender os princípios do DBT em produção** → leia o [`DBT em Produção - Princípios, Padrões e Boas Práticas.pdf`](./Playbooks%20-%20DBT/DBT%20em%20Produção%20-%20Princípios%2C%20Padrões%20e%20Boas%20Práticas.pdf)

---

## 📌 Observações

- Os scripts são **exemplos reais** utilizados em projetos. Adapte-os conforme necessário.
- Os PDFs são **documentos vivos** — sugestões e melhorias são bem-vindas.

---
