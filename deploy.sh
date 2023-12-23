#!/bin/bash

#variables
DEV_IMAGE="nivedha02/dev"
PROD_IMAGE="nivedha02/prod"
DEV_CONTAINER_NAME="myapp-dev-container"
PROD_CONTAINER_NAME="myapp-prod-container"
DEV_HOST_PORT=8080
PROD_HOST_PORT=80
DOCKER_NETWORK="bridge"

#pull the docker images
sudo docker pull $DEV_IMAGE
sudo docker pull $PROD_IMAGE

#stop and remove existing containers (if any)
sudo docker stop $DEV_CONTAINER_NAME || true
sudo docker rm $DEV_CONTAINER_NAME || true


sudo docker stop $PROD_CONTAINER_NAME || true
sudo docker rm $PROD_CONTAINER_NAME || true

#run the docker containers
sudo docker run -itd -p $DEV_HOST_PORT:80 --name $DEV_CONTAINER_NAME --network $DOCKER_NETWORK $DEV_IMAGE
sudo docker run -itd -p $PROD_HOST_PORT:80 --name $PROD_CONTAINER_NAME --network $DOCKER_NETWORK $PROD_IMAGE

echo "Deployment is completed."
