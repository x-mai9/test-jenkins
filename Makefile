# Makefile for Jenkins

IMAGE_NAME = test-docker
CONTAINER_NAME = node-dev
# See Dockerfile for the path in container
PATH_IN_CONTAINER = /usr/src/test
PATH_IN_HOST = .
REPORT_FILE = reports.xml

.PHONY: build run copy clean

# Build the docker image from Dockerfile
build: docker build -t $(IMAGE_NAME) -f Dockerfile .
# Run a container using the created image and run the test
# Without "|| true", Jenkins will fail and won't continue the rest of the script (meaning it won't copy the test result or clean up the docker)
run: docker run --name $(CONTAINER_NAME) $(IMAGE_NAME) //bin/bash -c "npm test || true"
# Copy test report from container to host
copy: docker cp $(CONTAINER_NAME):$(PATH_IN_CONTAINER)/$(REPORT_FILE) $(PATH_IN_HOST)/$(REPORT_FILE)
# Clean up the container
clean: 
    docker stop $(CONTAINER_NAME)
    docker rm $(CONTAINER_NAME)
    docker rmi $(IMAGE_NAME)

