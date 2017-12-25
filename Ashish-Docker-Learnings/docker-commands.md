

I completed the course on “Docker Quickstart” at LinuxAcademy recently. Throughout the course, I made some notes on the important commands I found myself using over and over again. If you are new to Docker, here are my notes on getting started with the tool.
Installing Docker

All commands as root on CentOs7:

cd /etc/yum.repos.d

vim docker.repo


[dockerrepo]

name=Docker Repository

baseurl=https://yum.dockerproject.com/repos/main/centos/7/

enabled=true

gpgcheck=1

gpgkey=https://yum.dockerproject.org/gpg

yum install docker-engin

systemctl enable docker

systemctl start docker

usermod -a -G docker <username>

cat /etc/group | grep docker #should use the <username> as the group for the docker program


Docker Commands

List images:

docker images


List running docker processes:

docker ps


List all processes that were ever run:

docker ps -a


List only the container IDs:

docker ps -a -q


Running processes:

docker run <image>

docker run -d <image> = run in disconnected / daemon mode

docker run --name="Some Name" = name the running instance

docker start <name> = will restart a closed / exited instance of the image

docker exec -it <name> <command> = run a command within a running container without changing the state of the running container

docker stop <name> = stop a running container by using the name


Cleaning up Docker:

docker rm containerid = removes an instance of the container that was run

docker rm `docker ps -a -q` = remove all stopped containers

docker rmi image-name = removes the docker image and its dependencies


Redirect port:

docker run -P = will redirect the container's port to a random port on the host machine's user port (port no 32,000+)

docker run -p 8080:80 = will redirect the container's port 80 to a port 8080 on the host machine's user port 

docker port <container-name> = will list the port mapping information


Adding volume:

using the "-v" option mounts the local file system. eg to mount for an nginx on centos

-v /home/user/www:/usr/share/nginx/html


Building a Docker file:

docker login --username=<username>

Enter password

docker push username/repo

**********************************************************************************************************************************************

Some Extra Commands:
====================

Delete all containers:
----------------------
$ docker rm $(docker ps -a -q)

Delete all images:
------------------
$ docker rmi $(docker images -q)

$ docker-compose down : This will remove the containers and default network, but preserve your wordpress database. 

$ docker-compose down --volumes : This will remove the containers, default network, and the wordpress database.

$ docker images --filter=reference='portainer/portainer:latest'
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
portainer/portainer   latest              47dbf4321bb4        5 weeks ago         10.7MB

$ docker images --filter=reference='portainer/portainer:latest' --format '{{.ID}}'
47dbf4321bb4





