FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN adduser --disabled-password --gecos "" appuser
USER appuser
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
 CMD pgrep -f "python main.py" || exit 1
CMD ["python", "main.py"]