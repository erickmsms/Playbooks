#!/usr/bin/env bash

# Garante que o script pare se qualquer comando falhar
set -e

# Variáveis para facilitar a manutenção
IMAGE_NAME="imageacessorias"
TAG="latest"
PROJECT_ID="bwa-global-483613"
REGION="us-east4"
REPO_NAME="bronze-acessorias"
JOB_NAME="job-bronze-acessorias"
FULL_IMAGE_PATH="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${IMAGE_NAME}:${TAG}"

echo "🚀 Iniciando processo de deploy para Google Ads..."

# 1. Verificar/Criar Repositório no Artifact Registry
# O '|| true' evita que o script pare se o repositório já existir
echo "🔍 Verificando repositório no Artifact Registry..."
gcloud artifacts repositories describe ${REPO_NAME} --location=${REGION} > /dev/null 2>&1 || \
(echo "✨ Criando repositório ${REPO_NAME}..." && \
 gcloud artifacts repositories create ${REPO_NAME} \
    --repository-format=docker \
    --location=${REGION} \
    --description="Docker repo")

# 2. Build da imagem
echo "📦 Buildando a imagem Docker..."
# O contexto do build (.) é a raiz para acessar projeto_bstudio e Dockerfile 
docker build -t ${IMAGE_NAME}:${TAG} -f Dockerfile .

# 3. Tagging
echo "🏷️ Adicionando tag da imagem..."
docker tag ${IMAGE_NAME}:${TAG} ${FULL_IMAGE_PATH}

# 4. Push para o Artifact Registry
echo "☁️ Fazendo push para o Google Artifact Registry..."
docker push ${FULL_IMAGE_PATH}

# 5. Criar ou Atualizar o Job no Cloud Run
echo "🔄 Sincronizando Job no Cloud Run..."
gcloud run jobs describe ${JOB_NAME} --region=${REGION} > /dev/null 2>&1 && \
  ACTION="update" || ACTION="create"

echo "🛠️ Executando gcloud run jobs ${ACTION}..."
gcloud run jobs ${ACTION} ${JOB_NAME} \
  --image ${FULL_IMAGE_PATH} \
  --region ${REGION}

echo "✅ Pipeline Google Ads implantado com sucesso!"#!/usr/bin/env bash

# Garante que o script pare se qualquer comando falhar
set -e

# Variáveis para facilitar a manutenção
IMAGE_NAME="imageacessorias"
TAG="latest"
PROJECT_ID="bwa-global-483613"
REGION="us-east4"
REPO_NAME="bronze-acessorias"
JOB_NAME="job-bronze-acessorias"
FULL_IMAGE_PATH="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${IMAGE_NAME}:${TAG}"

echo "🚀 Iniciando processo de deploy para Google Ads..."

# 1. Verificar/Criar Repositório no Artifact Registry
# O '|| true' evita que o script pare se o repositório já existir
echo "🔍 Verificando repositório no Artifact Registry..."
gcloud artifacts repositories describe ${REPO_NAME} --location=${REGION} > /dev/null 2>&1 || \
(echo "✨ Criando repositório ${REPO_NAME}..." && \
 gcloud artifacts repositories create ${REPO_NAME} \
    --repository-format=docker \
    --location=${REGION} \
    --description="Docker repo")

# 2. Build da imagem
echo "📦 Buildando a imagem Docker..."
# O contexto do build (.) é a raiz para acessar projeto_bstudio e Dockerfile 
docker build -t ${IMAGE_NAME}:${TAG} -f Dockerfile .

# 3. Tagging
echo "🏷️ Adicionando tag da imagem..."
docker tag ${IMAGE_NAME}:${TAG} ${FULL_IMAGE_PATH}

# 4. Push para o Artifact Registry
echo "☁️ Fazendo push para o Google Artifact Registry..."
docker push ${FULL_IMAGE_PATH}

# 5. Criar ou Atualizar o Job no Cloud Run
echo "🔄 Sincronizando Job no Cloud Run..."
gcloud run jobs describe ${JOB_NAME} --region=${REGION} > /dev/null 2>&1 && \
  ACTION="update" || ACTION="create"

echo "🛠️ Executando gcloud run jobs ${ACTION}..."
gcloud run jobs ${ACTION} ${JOB_NAME} \
  --image ${FULL_IMAGE_PATH} \
  --region ${REGION}

echo "✅ Pipeline Google Ads implantado com sucesso!"