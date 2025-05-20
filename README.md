# Dabotman Containers

This repository includes a `docker-compose.yml` with several services used in the project. A sample `.env.example` file is provided to configure environment variables for the containers.

## Setup

1. Copy `.env.example` to `.env` and fill in the required values.

```bash
cp .env.example .env
# edit .env
```

2. Build the BERT image and start the services with docker compose.

```bash
docker compose build bert
docker compose up -d
```

The services will be available on the following ports by default:

- **OpenWebUI** – <http://localhost:3000>
- **Langfuse** – <http://localhost:3001>
- **SearXNG** – <http://localhost:3002>
- **LlamaIndex** – <http://localhost:3003>
- **Neo4j** – bolt on `7687` and web on `7474`
- **Portainer** – <https://localhost:9443>

## BERT Container

`Dockerfile.bert` builds a minimal image with the Hugging Face `transformers` library. The `entrypoint.sh` script downloads the model specified by the `BERT_MODEL` environment variable when the container starts.

You can run it alone using:

```bash
docker compose run bert
```

The downloaded model files are stored in the `bert-models` volume.
