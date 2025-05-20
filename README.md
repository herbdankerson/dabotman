# Dabotman Containers

This repository includes a `docker-compose.yml` with several services used in the project. A sample `.env.example` file is provided to configure values that may be needed by the individual containers.

## Setup

1. Copy `.env.example` to `.env` and fill in the required values.

```bash
cp .env.example .env
# edit .env
```

2. Build the BERT images and start the services with docker compose.

```bash
docker compose build bert-base bert-large
docker compose up -d
```

The services will be available on the following ports by default:

- **OpenWebUI** – <http://localhost:3000>
- **Langfuse** – <http://localhost:3001>
- **SearXNG** – <http://localhost:3002>
- **LlamaIndex** – <http://localhost:3003>
- **Neo4j** – bolt on `7687` and web on `7474`
- **Portainer** – <https://localhost:9443>
- **Supabase** – <http://localhost:5432>
- **TigerGraph** – REST on `9000` and UI on `14240`
- **Docling** – <http://localhost:8501>

## BERT Container

`Dockerfile.bert` builds a minimal image with the Hugging Face `transformers` library. Each BERT service is built with a different model using build arguments so no runtime environment variables are required. The `entrypoint.sh` script downloads the model on start.

You can run it alone using:

```bash
docker compose run bert-base
```

The downloaded model files are stored in the `bert-models` volume.
