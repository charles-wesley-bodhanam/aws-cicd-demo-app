#!/bin/bash
set -e

AWS_REGION=us-east-1
ACCOUNT_ID=825765423621
ECR_REPO=aws-cicd-demo
IMAGE_TAG=latest

echo "Logging in to ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login \
  --username AWS \
  --password-stdin ${825765423621}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "Pulling Docker image..."
docker pull ${825765423621}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}

echo "Stopping old container if exists..."
docker stop aws-cicd-app || true
docker rm aws-cicd-app || true

echo "Starting new container..."
docker run -d \
  --name aws-cicd-app \
  -p 80:80 \
  ${825765423621}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}

