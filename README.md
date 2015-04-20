# DockerAppContainer
Docker container

A simple Docker Web App container that allows you to run web application has a container.

1.  Download Dockerfile and save it in directory
2.  Add ROOT.war file in the same directory
3.  Install Docker from here https://docs.docker.com/installation/
4.  Run the below commands from the directory containing Dockerfile/ROOT.war to build and start docker container

sudo docker build  -t ganesh/servername .

sudo docker run -rm -v /dev/log:/dev/log -p 8080:80 --name "my_web_server" ganesh/servername 

 Examine container contents
  
sudo docker run -i -t ganesh/servername bash
