=======================================================================================
Chapter 2: Docker Commands and Start/Stop/Restart Docker Images running as a containers:
=======================================================================================

Docker Parts:
=============
Docker Daemon      : Service that runs on Linux container(LXC) as the host.
Docker CLI         : Command line to issue commands and communicate with the daemon.
Docker Image Index : Repository(public and private) for docker images that anybody can create and
					 make it available to use.

Docker Elements:
================
Docker Containers : The actual directory on a computer that has everything in the docker application
					which we are going to launch.
Docker images 	  : When the container is rolled up we get a docker image. It is a snapshot of containers
					that includes a base operating system like ubuntu plus any additionally iterative
					changes we did to the os since the last time we saved the image.
Docker Files 	  : Scripts file which automate the build process of creating an image.

Key Features of Docker Elements:
================================
Application Portability.
Isolating Processes.
Prevention from tempering.
Managing resource consumption.

Docker Commands:
================
$ docker info     : Gives the full docker installation details. Output in the beginning of this file.
$ docker images   : Gives us a static list of images that we have pulled from docker hub(repository)
				  and have it locally that we can take actions on.
$ docker ps 	  : Gives us a list of images that have become containers and are being used; either
				  currently running or not running.
$ docker ps -a    : The -a switch shows us what all containers we have executed previously.
$ docker pull     : Use to retrieve an image from docker hub.
$ docker start    : Begins the execution of docker container. (ex: docker start postgres)
$ docker restart  : Restarts the containers.
$ docker stop     : Issues a kill command to the container to stop running.
$ shutdown -h now : shuts down the daemon. Run this command in the daemon.(Virtual Box)
$ docker rm mongo : removes the mongo db image from the container list. (Still be visible in $ docker images)
						Only images which are not running as a container can be removed.
$ docker rmi mongo: Now it will remove from the image list. Won't be visible in ($docker images)

$ docker stop $(docker ps -a -q) 			: Stops all the containers
$ docker rm $(docker ps -a -q)   			: Removes all the containers
$ docker rm -f container 		 					: remove the container forcefully
$ docker pull ubuntu			 						: docker pull ubuntu:latest
$ docker search ubuntu			 					: search image from the command line
$ docker images -q				 						: get all the images id
$ docker rmi $(docker images -q) 			: remove all the images at once
$ docker inspect images 		 					: gives information about that image
$ docker exec -it <mycontainer> bash 	: run arbitrary commands inside an existing container

3 step process to remove image from docker:
===========================================
$ docker stop mysql		[Stop the image which is running as a container] : [Stop the container]
$ docker rm   mysql		[Remove the image from the container list]     	 : [Delete or remove the container]
$ docker rmi  mysql		[Remove the image from the image list]			 : [Remove the image]


Some new commands:
==================
Running the run command with the -it flags attaches us to an interactive tty in the container.
Now you can run as many commands in the container as you want. Take some time to run your favorite commands.

$ docker run -it alpine /bin/sh

You are now inside the container shell and you can try out a few commands like ls -l, uname -a and others.
Exit out of the container by giving the exit command.

Running a container with detached mode:
=======================================
The -d flag enables detached mode, which detaches the running container from the terminal/shell
and returns your prompt after the container starts.


What happenens behind the scenes when you call run?
===================================================

1. The Docker client contacts the Docker daemon

2. The Docker daemon checks local store if the image (alpine in this case) is available locally, and if not, dowloads it from Docker Store. (Since we have issued docker pull alpine before, the download step is not necessary)

3. The Docker daemon creates the container and then runs a command in that container.

4.The Docker daemon streams the output of the command to the Docker client

Images Tags and Id:
===================
The TAG refers to a particular snapshot of the image.
ID is the corresponding unique identifier for that image.

Base images and child images:
=============================

Base images:
============
They are images that have no parent images, usually images with an OS like ubuntu, alpine or debian.

Child images:
============
They are images that build on base images and add additional functionality.

CMD:
====
The primary purpose of "CMD" is to tell the container which command it should run by default when it is started.
