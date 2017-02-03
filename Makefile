# To run the test inside the container, log the result, and copy the result to host
# Can either run the test in the Dockerfile with npm (then result will be permanent to the image)
#       or get in the container shell then run the test (result will be for the container only)
# Makefile
IMAGE_NAME = test-docker
CONTAINER_NAME = node-dev
# See Dockerfile for the path in container
PATH_IN_CONTAINER = /usr/src/test
PATH_IN_HOST = .
REPORT_FILE = reports.xml
TEST_SCRIPT = run-test.sh

# Build the docker image from Dockerfile
build: docker build -t $(IMAGE_NAME) -f Dockerfile .
# Run a container using the created image and run the test
run: docker run --name $(CONTAINER_NAME) $(IMAGE_NAME) //bin/bash -c "npm test"
# Copy test report from container to host
copy: docker cp $(CONTAINER_NAME):$(PATH_IN_CONTAINER)/$(REPORT_FILE) $(PATH_IN_HOST)/$(REPORT_FILE)
# Clean up the container
clean: 
    docker stop $(CONTAINER_NAME)
    docker rm $(CONTAINER_NAME)
    docker rmi $(IMAGE_NAME)

