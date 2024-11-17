#!/usr/bin/env bash
set -o errexit

# Use the system Python interpreter
python -m pip install --no-cache-dir --upgrade pip
python -m pip install --no-cache-dir -r requirements.txt

cd Project

python manage.py collectstatic --no-input
python manage.py migrate
