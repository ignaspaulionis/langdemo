#!/bin/bash

# Navigate to the JavaScript directory
cd /app/code/js/

# Ensure all dependencies are installed (in case of any changes to package.json)
npm install mysql2

# Run the JavaScript script
node /app/code/js/hello.js
