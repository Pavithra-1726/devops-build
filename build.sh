#!/bin/bash

# Variables
IMAGE_NAME="react-app"
DOCKER_HUB_USERNAME="bubbly17"

# Build Docker Image
docker build -t $IMAGE_NAME .

# Tag the image
docker tag $IMAGE_NAME $DOCKER_HUB_USERNAME/dev:$IMAGE_NAME

echo "Docker Image built successfully."

