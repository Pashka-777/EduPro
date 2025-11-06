# Base image
FROM python:3.11-slim

# Ortam değişkenleri
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Çalışma dizini
WORKDIR /app

# Gereksinimler
COPY requirements.txt /app/
RUN apt-get update && apt-get install -y build-essential libpq-dev && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Proje dosyalarını kopyala
COPY . /app/

# Port ve komut
EXPOSE 8000
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]
