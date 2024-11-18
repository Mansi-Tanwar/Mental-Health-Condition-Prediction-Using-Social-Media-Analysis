#!/usr/bin/env bash
set -o errexit

cd Project

# Print the current working directory
echo "Current working directory: $(pwd)"

# Print the Python module search path
echo "Python search path: $PYTHONPATH"
python -c "import sys; print(sys.path)"

# Try importing the Survey app
python -c "import Survey; print('Survey app imported successfully')"

# Install dependencies
python -m pip install --no-cache-dir --upgrade pip
python -m pip install --no-cache-dir -r requirements.txt


# Collect static files
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate
