# Makefile 

build: 
	docker build -t "test:node-docker" -f Dockerfile.build
