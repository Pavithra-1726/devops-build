#!/bin/bash

# Variables
IMAGE_NAME="react-app"
DOCKER_HUB_USERNAME="bubbly17"
DEV_TAG="$DOCKER_HUB_USERNAME/dev:$IMAGE_NAME"

# Build Docker Image
docker build -t $IMAGE_NAME .

# Tag the Image for Docker Hub
docker tag $IMAGE_NAME $DEV_TAG

echo "Docker Image built and tagged successfully."
