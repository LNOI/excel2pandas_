#!/bin/bash

# Copy the .env file to the API and Worker directories
cp .env API/
cp .env Worker/

# Start the Kafka and Minio containers in detached mode
docker-compose -f docker-compose-kafka.yml up --build -d
docker-compose -f docker-compose-minio.yml up --build -d

# Stop and remove any existing containers for the API service
# Build a new container image for the API service
# Start a new container for the API service
EXPOSE_PORT=8690 \
    CONTAINER_IMAGE=kpmg-server \
    BUILD_IMAGE_TAG=latest \
    CONTAINER_NAME=$CONTAINER_IMAGE-$EXPOSE_PORT \
    docker-compose -f API/docker-compose.yml down --remove-orphans

EXPOSE_PORT=8690 \
    CONTAINER_IMAGE=kpmg-server \
    BUILD_IMAGE_TAG=latest \
    CONTAINER_NAME=$CONTAINER_IMAGE-$EXPOSE_PORT \
    docker-compose -f API/docker-compose.yml build --force-rm

EXPOSE_PORT=8690 \
    CONTAINER_IMAGE=kpmg-server \
    BUILD_IMAGE_TAG=latest \
    CONTAINER_NAME=$CONTAINER_IMAGE-$EXPOSE_PORT \
    docker-compose -f API/docker-compose.yml up -d

# Stop and remove any existing containers for the Worker service
# Start a new container for the Worker service
docker-compose -f  Worker/docker-compose.yml down --remove-orphans
docker-compose -f  Worker/docker-compose.yml up --build -d

# Remove any dangling images (images not tagged and not used by any container)
docker image rm $(docker image ls -a --filter "dangling=true" -q)
