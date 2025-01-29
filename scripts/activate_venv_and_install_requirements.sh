#!/bin/bash

set -e  # Exit on errors

# Activate virtual environment
source /new_chatapp/venv/bin/activate

# Install required dependencies
pip install -r /new_chatapp/requirements.txt
