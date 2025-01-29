#!/bin/bash

set -e  # Exit on errors

# Navigate to the app directory
cd /new_chatapp/fundoo

# Run database migrations
python3 manage.py makemigrations
bash ~/run_migrate.sh

# Restart Django service
sudo systemctl restart django.service
sudo systemctl status django.service
