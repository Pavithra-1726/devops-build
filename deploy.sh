#!/bin/bash

# Variables
IMAGE_NAME="react-app"
DOCKER_HUB_USERNAME="bubbly17"
DEV_TAG="$DOCKER_HUB_USERNAME/dev:$IMAGE_NAME"

# Login to Docker Hub
docker login -u $DOCKER_HUB_USERNAME

# Push Image
docker push $DEV_TAG

echo "Docker Image pushed to Docker Hub successfully."

