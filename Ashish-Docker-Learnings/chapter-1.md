=========================
Chapter 1: Pre-Requsites:
=========================

On Windows Machine.

1. ConEmu
2. Docker ToolBox (Since my system is Home-Office.)
3. Oracle VM virtual Box. (This comes as a part of toolbox)


Terminologies:
==============
A lot of Docker-specific jargon which might be confusing to some. 
So before you go further, let's clarify some terminology that is used frequently in the Docker ecosystem.

Images:
-------
The file system and configuration of our application which are used to create containers. To find out more about a Docker image, run "$ docker inspect alpine". In the demo above, you used the docker pull command to download the alpine image. When you executed the command docker run hello-world, it also did a docker pull behind the scenes to download the hello-world image.

Containers:
-----------
Running instances of Docker images — containers run the actual applications. A container includes an application and all of its dependencies. It shares the kernel with other containers, and runs as an isolated process in user space on the host OS. You created a container using docker run which you did using the alpine image that you downloaded. A list of running containers can be seen using the "$ docker ps" command.

Docker daemon:
--------------
The background service running on the host that manages building, running and distributing Docker containers.

Docker client:
--------------
The command line tool that allows the user to interact with the Docker daemon.

Docker Store:
-------------
A registry of Docker images, where you can find trusted and enterprise ready containers, plugins, and Docker editions

Docker File:
------------
A Dockerfile is a text file that contains a list of commands that the Docker daemon calls while creating an image. 
The Dockerfile contains all the information that Docker needs to know to run the app — a base Docker image to run from, location of your project code, any dependencies it has, and what commands to run at start-up. 
"It is a simple way to automate the image creation process". 
The best part is that the commands you write in a Dockerfile are almost identical to their equivalent Linux commands. 
This means you don't really have to learn new syntax to create your own Dockerfiles.
