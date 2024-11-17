#!/bin/bash

python3 -m venv /app/code/python/venv 

/app/code/python/venv/bin/pip install mysql-connector-python

# Activate the virtual environment
source /app/code/python/venv/bin/activate

python3 /app/code/python/hello.py