# Use official Python image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Copy requirements and install dependencies first (for caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project
COPY . /app

# Collect static files
RUN python manage.py collectstatic --noinput

# Expose the port (optional)
EXPOSE 8000

# Start Gunicorn
CMD ["gunicorn", "Project.wsgi:application", "--bind", "0.0.0.0:8000"]
