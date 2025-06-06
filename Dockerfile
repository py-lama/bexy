FROM python:3.10-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install additional dependencies for the API
RUN pip install --no-cache-dir fastapi uvicorn

# Copy the package files
COPY . .

# Install the package in development mode
RUN pip install -e .

# Expose the API port
EXPOSE 8000

# Command to run the API server
CMD ["python", "-m", "bexy.api"]
