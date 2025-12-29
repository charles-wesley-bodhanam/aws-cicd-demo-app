#!/bin/bash
set -e

echo "Starting application..."

# Simple Node.js app start
cd /home/ec2-user/app

# Install dependencies if needed
if [ -f package.json ]; then
  npm install --production
fi

# Start app (basic example)
nohup node app.js > app.log 2>&1 &
