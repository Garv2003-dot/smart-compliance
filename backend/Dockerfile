FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system deps needed for common packages (adjust if you don't need them)
RUN apt-get update && apt-get install -y build-essential gcc libpq-dev curl && rm -rf /var/lib/apt/lists/*

# Install python deps
COPY backend/requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy app
COPY backend/ /app

# Copy entrypoint
COPY backend/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
