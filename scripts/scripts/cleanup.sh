#!/bin/bash
echo "Cleaning up previous containers..."

docker ps -q --filter "name=node-app" | xargs -r docker stop
docker ps -aq --filter "name=node-app" | xargs -r docker rm
