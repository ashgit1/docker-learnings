[~/Documents/Ashu/open-source-projects/SEDASH $ ] docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world

c04b14da8d14: Pull complete
Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker Hub account:
 https://hub.docker.com

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/

 Links went through:
 ===================
 https://docs.docker.com/docker-for-mac/
 https://docs.docker.com/engine/getstarted/
 https://docs.docker.com/docker-for-mac/examples/

 Definition:
 ===========
 Image: An image is a filesystem and parameters to use at runtime. It doesn’t have state and never changes.

 Container: A container is a running instance of an image.

 When you ran the command "$ docker run hello-world ", Docker Engine:

 1. checked to see if you had the hello-world software image
 2. downloaded the image from the Docker Hub (more about the hub later)
 3. loaded the image into the container and “ran” it

 DockerFile : A Dockerfile is a recipe which describes the files, environment, and commands that make up an image.
              Automates the process of creating the images.
 Note:
 =====

 1. Who built the hello-world software image though?
 In this case, Docker did but anyone can. Docker Engine lets people (or companies) create and share software through Docker images.
 Using Docker Engine, you don’t have to worry about whether your computer can run the software in a Docker image — a Docker container can always run it.

 2. Remember that if you are using macOS or Windows, you are still creating an image which runs on Linux.

 3. Build process: (https://docs.docker.com/engine/getstarted/step_four/)
 The "$ docker build -t docker-whale ." command reads the Dockerfile in the current directory and processes its instructions one by one to build an image called "docker-whale" on your local machine.

 4. Tagging the image to include your username as namespace and then publishing to dockerhub:
 Use IMAGE ID and the docker tag command to tag your docker-whale image.
 $ docker tag 7d9495d03763 ashudoc/docker-whale:latest
 $ docker images
 $ docker login
 $ docker push ashudoc/docker-whale

 Commands:
 =========
To tag the docker image before push:
[docker tag IMAGE-ID username/imagename:version-no or tag]
ex:
$ docker tag 7d9495d03763 ashudoc/docker-whale:latest

$ docker login 						[Login to docker hub]
$ docker rmi -f 37d61c792c5d 		[Removes an image forcefully]
$ docker run ashudoc/docker-whale	[Pulls and runs my image from the docker hub repo]

Where to go next ?
==================

You’ve done a lot, you’ve done all of the following fundamental Docker tasks.

    installed Docker
    run a software image in a container
    located an interesting image on Docker Hub
    run the image on your own machine
    modified an image to create your own and run it
    create a Docker Hub account and repository
    pushed your image to Docker Hub for others to share

Go to the below link for further learnings:
===========================================
https://docs.docker.com/engine/getstarted/last_page/
https://docs.docker.com/docker-for-mac/
https://docs.docker.com/docker-for-mac/examples/
https://docs.docker.com/engine/tutorials/
