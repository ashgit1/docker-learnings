****************
Docker Networks
****************
Lecture 26:

Show networks
==============
$ docker network ls:

Inspect a network
==================
$ docker network inspect:

Create a network
=================
$ docker network create --driver:
ex: 
$ docker network create my-app-net (maps to the default driver which is bridge)
$ docker container run -idt --name new-nginx --network my-app-net nginx


Attach a network to a container
================================
$ docker network connect:
ex:
docker network connect network-id container-id (adding container to this network)

Add the webhost(nginx server) container created earlier to the network we created and the do 
$ docker container inspect webhost-id:
This will show the above container on two networks


Detach a networ from container
===============================
$ docker network disconnect:
ex:
docker network disconnect network-id container-id (removing container from this network)
This will remove the container from the network attached before


Summary:
=========
$ docker network ls:
NETWORK ID          NAME                DRIVER              SCOPE
848c035d693b        bridge              bridge              local
ace05fbe2d7e        host                host                local
fdd05be4cb9d        my-app-net          bridge              local
8ec8a7b32605        none                null                local

$ docker container ls:
CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                    NAMES
1043a00208b8        nginx                 "nginx -g 'daemon ..."   15 minutes ago      Up 15 minutes       80/tcp                   new-nginx
1bfd6f4401fe        nginx                 "nginx -g 'daemon ..."   40 hours ago        Up 27 minutes       0.0.0.0:80->80/tcp       webhost

$ docker network connect fdd05be4cb9d 1bfd6f4401fe:

$ docker network disconnect fdd05be4cb9d 1bfd6f4401fe:


*********************
Docker Networks DNS:
*********************

Lecture 27:
"--link" option enables DNS on default bridge network.
Docker daemon has a build-in DNS server that containers use by default.

Containers shouldn't use IP's for inter container communication.
DNS for friendly names is built-in if you use custom networks.

Always try to use custom networks for your app instead of using "--link".
This gets easier with Docker Compose which we will see later.































