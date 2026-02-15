# Use the official Python slim image for a smaller footprint
FROM python:3.11-slim

# Prevents Python from writing pyc files to disc and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install dependencies first (leverages Docker layer caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port (Cloud Run defaults to 8080)
EXPOSE 8080

# Run the application
CMD ["python", "main.py"]