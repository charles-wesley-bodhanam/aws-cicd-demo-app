#!/bin/bash
aws ecr get-login-password --region us-east-1 ^
| docker login --username AWS --password-stdin 825765423621.dkr.ecr.us-east-1.amazonaws.com

docker pull 825765423621.dkr.ecr.us-east-1.amazonaws.com/aws-cicd-demo-app:latest

docker run -d --name aws-cicd-app -p 80:3000 ^
825765423621.dkr.ecr.us-east-1.amazonaws.com/aws-cicd-demo-app:latest
