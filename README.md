# test-jenkins
  
Jenkins will build the docker image and start a container using that image.  
It then run the test inside container, log the result, and copy the result to Jenkins server and display it.  
  
##To run the test:##  
1. Run the test in the Dockerfile with npm = test will be run when building the image  
	-> Test result will be permanent to the image  
    
**RECOMMEND THIS**  
2. Build the image and start a container with the command to run the test  
	-> Test result will be for the container only  

**Makefile basic syntax:** *(tabs does matter - Makefile only takes tabs, not spaces)*  
target: dependencies  
	command1  
    command2  