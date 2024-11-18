#!/usr/bin/env bash
set -o errexit

# Use the system Python interpreter
python -m pip install --no-cache-dir --upgrade pip
python -m pip install --no-cache-dir -r requirements.txt

cd Project

# Print the directory structure to confirm Survey's location
echo "Directory structure:"
ls -R

# Check Python version
python --version

# Check if 'Survey' is accessible
python -c "import Survey"


python manage.py collectstatic --no-input
python manage.py migrate
