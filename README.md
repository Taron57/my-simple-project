# my-simple-project
a simple dockerfile and script for build and push to the DockerHub


Main goals:

Create custom docker image (Dockerfile) from ubuntu:22.04 image and push it into the DockerHub.
Write script which will takes input parameters, build the custom image and push it into DockerHub registry.

script name:  build-publish.sh

parameters:
    dockerhub_username
    dockerhub_password
    dockerfile
    image_repository_name
    image_tag

Dockerfile should install vim, mc, nginx, curl





  Usage 

chmod +x build-publish.sh

./build-publish.sh your_username your_password ./Dockerfile my-custom-image latest

 Security Note

Avoid hardcoding passwords in scripts. For better security, consider using environment variables or Docker credential helpers.
