# Stage 1 - builder
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --target=/app/packages

# Stage 2 - final
FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /app/packages /app/packages
COPY . .
ENV PYTHONPATH=/app/packages
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD pgrep -f "python worker.py" || exit 1
CMD ["python", "worker.py"]