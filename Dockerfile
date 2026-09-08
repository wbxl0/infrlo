FROM python:3.12-slim

WORKDIR /app

COPY app.py .

EXPOSE 3000

HEALTHCHECK --interval=60s --timeout=10s --start-period=15s --retries=3 \
    CMD python -c "import socket;s=socket.create_connection(('127.0.0.1',3000),5);s.close()"

CMD ["python", "app.py"]
