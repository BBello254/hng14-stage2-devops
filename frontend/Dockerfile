# Stage 1 - builder
FROM node:18-slim AS builder
WORKDIR /app
COPY package.json .
RUN npm install

# Stage 2 - final
FROM node:18-slim
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .

RUN adduser --disabled-password --gecos "" appuser
USER appuser
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
 CMD curl -f http://localhost:3000/health || exit 1

CMD ["node", "app.js"]