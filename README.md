Smart Compliance SaaS
AI-Powered Policy Management, HR Compliance, and Employee Acknowledgement Platform

A full-stack SaaS platform designed to help organizations manage policies, automate compliance workflows, track employee acknowledgements, maintain audit logs, and leverage AI for policy summarization & contradiction detection.

This project is built using a Python + Next.js monorepo architecture with microservices for notifications and AI processing.

🚀 Tech Stack
Frontend (apps/web)

Next.js 15 (App Router)

React Server Components

shadcn/ui + TailwindCSS

NextAuth for authentication

React Query / Zustand for state

File uploads → S3

Backend (apps/api)

FastAPI (Python)

SQLModel / SQLAlchemy ORM

Alembic migrations

PostgreSQL

MinIO/S3 for file storage

Supabase Vector Store for RAG/AI search

AI Worker (services/worker)

Celery / Redis job queue

Policy summarization

Contradiction analysis

Embeddings pipeline (OpenAI)

Infrastructure

Docker + Docker Compose

Redis for background tasks

Postgres for data

MinIO (local S3) for dev

Production: AWS (Mumbai region)
