#!/bin/bash

REGION=ap-south-1
ACCOUNT_ID=807772679248
IMAGE=807772679248.dkr.ecr.ap-south-1.amazonaws.com/backend:latest
CONTAINER_NAME=backend-container

echo "Login to ECR"
aws ecr get-login-password --region ap-south-1 | sudo docker login --username AWS --password-stdin 807772679248.dkr.ecr.ap-south-1.amazonaws.com

echo "Stop old backend container"
sudo docker stop $CONTAINER_NAME || true
sudo docker rm $CONTAINER_NAME || true

echo "Pull latest backend image"
sudo docker pull $IMAGE

echo "Run backend container"
sudo docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE