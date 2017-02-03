#!/bin/bash

PATH_IN_CONTAINER=/usr/src/test
PATH_IN_HOST=.
IMAGE_NAME=image-demo
CONTAINER_NAME=container-demo
REPORT_FILE=reports.xml

# Build the docker image from Dockerfile
docker build -t $IMAGE_NAME -f Dockerfile.notest .
# Run a container using the created image and run the test
docker run --name $CONTAINER_NAME $IMAGE_NAME //bin/bash -c "npm test"
# Copy test report from container to host
docker cp $CONTAINER_NAME:$PATH_IN_CONTAINER/reports.xml $PATH_IN_HOST/reports.xml
# Clean up the container
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
docker rmi $IMAGE_NAME
