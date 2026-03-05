FROM python:3.10-slim
WORKDIR /app
# Install required system packages for TLS and DNS
RUN apt-get update && apt-get install -y \
    ca-certificates \
    openssl \
    libssl-dev \
    dnsutils \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 5000
CMD ["python","app.py"]