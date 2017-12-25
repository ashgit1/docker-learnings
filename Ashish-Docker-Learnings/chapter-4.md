====================================
Chapter 4: Learning Docker Creation:
====================================

1. Create Docker Image:
=======================

There are two ways:
-------------------
Manual Implementation.
Docker File: Create a docker file which automates the process of creating the docker image.

Maual:
------
$ docker-machine ls;  [List all the VM which are available right now]
$ docker-machine start dockervm;
$ docker-machine env dockervm;
$ eval "$(docker-machine env dockervm)"
$ docker images;
$ docker search ubuntu;
$ docker pull ubuntu;
$ docker run -it ubuntu bash  [Run the image as a container]
This will also login you as root into the container[This is what we learned in chapter 3]
Now we can take this base image and do whatever modification we want to make to this image to create
a custom image that we want.
We will install a lamp stack on this image and make it as a brand new modified image.

First Install curl so that we can use it to verify once we get our lamp stack up and running.
$ sudo apt-get install curl;
Next step is to install mysql
$ sudo apt-get install mysql-server php5-mysql
$ sudo apt-get install php5 libapache2-mod-php5

[This installations are not happenning. Need to check it out]







2. Store Docker Image in Repository:
====================================












3. Learn about Docker File:
===========================
