# Usa uma imagem leve do Python
FROM python:3.9-slim

# Define a pasta de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de requisitos para dentro do container
COPY requirements.txt .

# Instala as bibliotecas necessárias
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código (seu main.py) para dentro
COPY . .

# Comando que roda quando o container inicia
CMD ["python", "mainacessorias.py"]