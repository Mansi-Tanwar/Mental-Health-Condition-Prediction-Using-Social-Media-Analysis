#!/usr/bin/env bash
# Exit on error
set -o errexit

# Ensure the local Python user package directory is in PATH
export PATH=$HOME/.local/bin:$PATH

# Upgrade pip and install dependencies globally (in user space)
pip install --no-cache-dir --user --upgrade pip
pip install --no-cache-dir --user -r requirements.txt

# Navigate to the 'Project' folder where manage.py is located
cd Project

# Collect static files (e.g., CSS, JS) without user input
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate
