FROM python:3.11-slim

# Variáveis de ambiente otimizadas para Google Ads
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    DBT_PROFILES_DIR=/app/.dbt \
    DBT_PROJECT_DIR=/app/projeto_bstudio \
    DBT_SOURCE_SELECTOR=youtube 

RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --upgrade pip \
 && pip install "dbt-core>=1.7,<2.0" "dbt-bigquery>=1.7,<2.0"

# Instala as dependências do dbt (packages.yml)
COPY projeto_bstudio/dbt_project.yml /app/projeto_bstudio/dbt_project.yml
# Se você tiver um packages.yml, descomente a linha abaixo:
# COPY projeto_bstudio/packages.yml /app/projeto_bstudio/packages.yml
RUN dbt deps --project-dir /app/projeto_bstudio

# Copia o projeto dbt inteiro
COPY projeto_bstudio /app/projeto_bstudio

# Copia os arquivos específicos do Google Ads de dentro da pasta docker
COPY docker/youtube/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Configuração do Profile (Dataset BigQuery do Google Ads)
RUN mkdir -p /app/.dbt
COPY docker/youtube/profiles.yml /app/.dbt/profiles.yml

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["run"]