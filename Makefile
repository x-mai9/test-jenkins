# Makefile 

ci: 
	docker build -t "test:node-docker" -f Dockerfile .
