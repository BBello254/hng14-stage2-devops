# HNG14 Stage 2 DevOps - Job Processing System

A containerized job processing system built with FastAPI, Node.js, and Redis.

## Architecture

- **Frontend** (Node.js/Express) - UI for submitting and tracking jobs on port 3000
- **API** (Python/FastAPI) - Creates jobs and serves status updates on port 8000
- **Worker** (Python) - Picks up and processes jobs from the queue
- **Redis** - Message queue shared between API and worker

## Prerequisites

- Git
- Docker Engine
- Docker Compose v2

## Setup

1. Clone the repository:
```bash
git clone https://github.com/BBello254/hng14-stage2-devops
cd hng14-stage2-devops
```

2. Create your environment file:
```bash
cp .env.example .env
```

## Running the Stack

Build and start all services:
```bash
docker-compose up --build
```

To run in the background:
```bash
docker-compose up --build -d
```

To stop all services:
```bash
docker-compose down
```

## What Success Looks Like

When everything is running correctly you will see:

- Redis ready to accept connections
- API running on http://localhost:8000
- Frontend running on http://localhost:3000
- Worker silently waiting for jobs

Visit `http://your-server-ip:3000` in your browser. Click **Submit New Job** and the job status should change from `queued` to `completed` within a few seconds.

## Environment Variables

See `.env.example` for all required variables.

| Variable | Description | Default |
|----------|-------------|---------|
| REDIS_HOST | Redis service hostname | redis |
| REDIS_PORT | Redis service port | 6379 |
| API_URL | API service URL for frontend | http://api:8000 |


 
