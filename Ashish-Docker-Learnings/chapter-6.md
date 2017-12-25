Source:
=======
	'https://docs.docker.com/engine/tutorials/networkingcontainers/'

Docker Networks:
================
By default, Docker provides two network drivers for you, the "bridge" and the "overlay" drivers.

	'$ docker network ls'

The network named bridge is a special network. 
Unless you tell it otherwise, Docker always launches your containers in this network.

Disconnect container from network:
==================================
You can remove a container from a network by disconnecting the container:
To do this, you supply both the network name and the container name.

	'$ docker network disconnect bridge networkest'

Create your own bridge network:
===============================
A bridge network is limited to a single host running Docker Engine.
An overlay network can include multiple hosts and is a more advanced topic.

	'$ docker network create -d bridge ashu_bridge'
	'$ docker network ls'

If you inspect the network, you’ll find that it has nothing in it:
	'$ docker network inspect ashu_bridge'

Add containers to a network:
============================
You can add containers to a network when you first run a container.
Launch a container running a PostgreSQL database and pass it the --net=ashu_bridge flag to connect it to your new network

	'$ docker run -d --net=ashu_bridge --name db training/postgres'

If you inspect your ashu_bridge you’ll see it has a container attached:
	'$ docker network inspect ashu_bridge'

You can also inspect your container to see where it is connected:	
	"$ docker inspect --format='{{json .NetworkSettings.Networks}}'  db"

Now, go ahead and start your by now familiar web application. This time don’t specify a network:
================================================================================================

	'$ docker run -d --name web training/webapp python app.py'

Which network is your web application running under? By default it will run 'bridge' network

Then, get the IP address of your web:
	"$ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' web"
	-->172.17.0.2

Now, open a shell to your running db container:

	"$ docker exec -it db bash"
	"root@a205f0dd33b2:/# ping 172.17.0.2"

After a while press Ctrl C the ping will failed. That is because the two containers are running on different networks.
	'db running on ashu_bridge network'
	'web running on default bridge network' 

We can fix this. Docker networking allows you to attach a container to as many networks as you like. 
You can also attach an already running container. 

Go ahead and attach your running web app to the ashu_bridge network:
	'$ docker network connect ashu_bridge web'

Now both the containers are attached to 'ashu_bridge' network:

Open a shell into the db application again and try the ping command. 
This time just use the container name web rather than the IP Address.
	'$ docker exec -it db bash'
	"root@a205f0dd33b2:/# ping web"
	"PING web (172.21.0.3) 56(84) bytes of data."

The ping shows it is contacting a different IP address, the address on the "ashu_bridge" network which is different 
from its address on the bridge network.

Next steps:
===========
	'Now that you know how to network containers, see how to manage data in containers.'
	'--> https://docs.docker.com/engine/tutorials/dockervolumes'



