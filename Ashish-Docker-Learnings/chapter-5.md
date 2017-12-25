===========
Reference:
===========
https://github.com/docker/labs/tree/master/beginner/
https://github.com/docker/labs

=================================
Running container in detach mode:
=================================
Let's launch a container in detached mode as shown below:

$ docker run --name static-site -e AUTHOR="Your Name" -d -P dockersamples/static-site
e61d12292d69556eabe2a44c16cbd54486b2527e2ce4f95438e504afb7b02810
In the above command:

-d will create a container with the process detached from our terminal
-P will publish all the exposed container ports to random ports on the Docker host
-e is how you pass environment variables to the container
--name allows you to specify a container name
AUTHOR is the environment variable name and Your Name is the value that you can pass

Now you can see the ports by running the docker port command.

$ docker port static-site
443/tcp -> 0.0.0.0:32772
80/tcp -> 0.0.0.0:32773

=========================
Building your own image:
=========================
The docker build command is quite simple - it takes an optional tag name with the -t flag, and the location of the directory containing the Dockerfile - the . indicates the current directory:

$ docker build -t <YOUR_USERNAME>/myfirstapp .
$ docker build -t ashudoc/myfirstflaskapp .
$ docker images
Output:
-------
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
ashudoc/myfirstflaskapp     latest              1031ea3b5e7d        20 minutes ago      57.4MB

===============
Run your image:
===============
$ docker run -p 8888:5000 --name myfirstflaskapp ashudoc/myfirstflaskapp 

http://localhost:8888

==================
Push your images:
=================
$ docker login
enter username and password.

$ docker push ashudoc/myfirstflaskapp 
