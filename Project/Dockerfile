# Use official Python image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Copy requirements first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port 8000
EXPOSE 8000

# Run Django server on all interfaces
CMD ["gunicorn", "Project.wsgi:application", "--bind", "0.0.0.0:8000"]


