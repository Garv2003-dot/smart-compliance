#!/usr/bin/env bash
set -e

# Simple wait for Postgres to be ready (basic)
echo "Waiting for Postgres..."
while ! pg_isready -h "${POSTGRES_HOST:=postgres}" -p 5432 -U "${POSTGRES_USER:=postgres}" >/dev/null 2>&1; do
  sleep 1
done

# Run alembic migrations if alembic exists (optional)
if [ -f "./alembic.ini" ]; then
  echo "Running alembic migrations..."
  alembic upgrade head || echo "Alembic failed (ok for initial dev)"
fi

# Start the FastAPI app with reload for dev
exec uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload
