# 使用官方 Python 映像檔
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 設定工作目錄
WORKDIR /app

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# 複製requirements.txt
COPY requirements.txt .

# 安裝 pip 套件
RUN pip install --upgrade pip && pip install -r requirements.txt