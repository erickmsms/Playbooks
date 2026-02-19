#!/usr/bin/env bash
set -euo pipefail

ACTION="${1:-run}"

# Você pode sobrescrever o seletor no docker run se quiser
SELECTOR="${DBT_SOURCE_SELECTOR:-youtube}"

case "$ACTION" in
  run)
    dbt run --project-dir "$DBT_PROJECT_DIR" --select "$SELECTOR"
    ;;
  test)
    dbt test --project-dir "$DBT_PROJECT_DIR" --select "$SELECTOR"
    ;;
  build)
    dbt build --project-dir "$DBT_PROJECT_DIR" --select "$SELECTOR"
    ;;
  docs)
    dbt docs generate --project-dir "$DBT_PROJECT_DIR"
    dbt docs serve --project-dir "$DBT_PROJECT_DIR" --host 0.0.0.0 --port 8080
    ;;
  debug)
    dbt debug --project-dir "$DBT_PROJECT_DIR"
    ;;
  *)
    echo "Uso: [run|test|build|docs|debug]"
    exit 1
    ;;
esac