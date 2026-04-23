# Stage 1 - builder
FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Stage 2 - final
FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY . .
RUN adduser --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
ENV PATH=/root/.local/bin:$PATH
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD pgrep -f "python worker.py" || exit 1
CMD ["python", "worker.py"]