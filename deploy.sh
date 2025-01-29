#!/bin/bash

# Variables
IMAGE_NAME="react-app"
DOCKER_HUB_USERNAME="bubbly17"

# Pull the latest image
docker pull $DOCKER_HUB_USERNAME/dev:$IMAGE_NAME

# Stop & remove old container
docker stop $IMAGE_NAME
docker rm $IMAGE_NAME

# Run new container
docker run -d -p 80:80 --name $IMAGE_NAME $DOCKER_HUB_USERNAME/dev:$IMAGE_NAME

echo "Application deployed successfully."

