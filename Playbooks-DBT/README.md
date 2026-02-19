# DBT no GCP — Guia Prático e Manual de Produção

## 📂 Conteúdo do Repositório

Este repositório é dividido em **dois documentos com objetivos distintos**, mas complementares.

### 📘 1. Guia de Implementação de Transformações com DBT no GCP

**(Playbook Executável)**

> *Passo a passo executável. Faça isso. Valide. Avance.*

Este documento é um **guia operacional**, focado em **execução prática**.
Ele descreve exatamente **o que fazer, em que ordem, e como validar cada etapa** para colocar um projeto DBT em funcionamento no GCP.

**Características:**

* Estrutura por etapas claras
* Comandos reais (`dbt run`, `dbt test`, Docker, Cloud Run Jobs)
* Validações explícitas (“só siga adiante se…”)
* Pensado para onboarding e padronização de times

Use este guia quando você quer **rodar DBT de verdade**, sem ambiguidade.

---

### 📖 2. DBT em Produção — Princípios, Padrões e Boas Práticas

**(Manual Técnico / Livro de Estudo)**

> *Entenda por que fazemos assim.*

Este documento funciona como um **manual de engenharia**, aprofundando as decisões técnicas por trás do uso do DBT em produção.

**Aborda temas como:**

* Papel do DBT no pipeline de dados
* Modelagem Silver e Gold
* Deduplicação correta e ordem de processamento
* Testes como mecanismo de escala
* Operação, observabilidade e rollback
* Mentalidade de confiabilidade de dados

Use este documento para **formar repertório técnico**, alinhar padrões e tomar decisões conscientes.

---

## 🧭 Como usar este repositório

* **Início rápido / execução:**
  👉 Comece pelo *Guia de Implementação de Transformações com DBT no GCP*

* **Aprofundamento técnico / referência:**
  👉 Consulte *DBT em Produção — Princípios, Padrões e Boas Práticas*

O ideal é usar **os dois em conjunto**:
um guia para executar, outro para entender e evoluir.

---

## 🎯 Público-alvo

* Engenheiros de Dados
* Analytics Engineers
* Times que usam DBT no BigQuery
* Pessoas interessadas em **engenharia de dados em produção**, não apenas em ferramentas

---

## 🏗️ Contexto Técnico

* DBT (BigQuery adapter)
* Google Cloud Platform
* BigQuery
* Cloud Run Jobs
* Pipelines analíticos em ambientes produtivos

