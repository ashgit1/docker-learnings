====================================================================================
Chapter 3: Creating, Attaching, and Virtual Machine Management with docker-machine:
====================================================================================

Virtual Machines:
=================
Here we will be building the VM that are not the generic and which are not built by docker quick-start terminal
or kitematic.
We will be building by using oracle VM virtual box. We can also use VMWare fusion.
Basically this VM which are building will be used to run the docker daemon.
Note: Path where the VM's are created : C:\Users\Ashish\.docker\machine\machines


Steps:
------
1. First remove the default virtual box from the VM virtual box.
2. Once it is empty let's create now a VM for the virtual box.
3. In the docker quick start terminal type the command to create the VM:

$ docker-machine create vmfordocker --driver=virtualbox
Output:
-------
....
....
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine,
run: C:\Program Files\Docker Toolbox\docker-machine.exe env vmfordocker

4. Run the above command to connect the docker client to the VM running docker daemon.
$ docker-machine.exe env vmfordocker

Output:
-------
Ashish@LAPTOP-6QKBKITC MINGW64 /c/Program Files/Docker Toolbox
$ docker-machine.exe env vmfordocker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.103:2376"
export DOCKER_CERT_PATH="C:\Users\Ashish\.docker\machine\machines\vmfordocker"
export DOCKER_MACHINE_NAME="vmfordocker"
# Run this command to configure your shell:
# eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env vmfordocker)

5. This gives the eval command. Run this.
Now after this command is run we can issue docker comands against the VM we created running docker daemon.

6. Now run the docker commands like $ docker images, docker ps and so on.
$ docker images;
Ther are no images as of now. Let's pull one image.
$ docker pull rabbitmq;
After it pulls the image. Run :
$ docker images; [shows the rabbitmq image. But it is still not running]
$ docker ps; [No images are running as a container]
$ docker start rabbitmq [starts the rabbitmq]
$ docker ps; [shows the rabbitmq image running as a container]

we can also run the rabbitmq by issuing the following command:
$ docker run -it rabbitmq
When it starts the process of running kill it by issuing Ctrl+C.
$ docker ps; [no output]
$ docker ps -a; [It shows it was running sometimes back but was exited]
Copy the CONTAINER_ID. we will need this to connect to this container.
$ docker start CONTAINER_ID.
$ docker start 177177827f87
$ docker ps; [Verify the ID. It shows the same id of the image which is running]
To connect to the container as a root issue the below command.
$ docker exec -it 177177827f87 bash

Output:
-------
Ashish@LAPTOP-6QKBKITC MINGW64 /c/Program Files/Docker Toolbox
$ docker exec -it 177177827f87  bash
root@177177827f87:/#

We can issue the below commands to get the listing of the properties of this machine:
[memory, kernel pool and so on]
root@177177827f87:/# rabbitmqctl status;

Output:
-------
Json String

Status of node rabbit@177177827f87 ...
[{pid,102},
 {running_applications,[{rabbit,"RabbitMQ","3.6.6"},
                        {os_mon,"CPO  CXC 138 46","2.4.1"},
                        {rabbit_common,[],"3.6.6"},
                        {xmerl,"XML parser","1.3.11"},
                        {ranch,"Socket acceptor pool for TCP protocols.",
                               "1.2.1"},
                        {mnesia,"MNESIA  CXC 138 12","4.14"},
                        {sasl,"SASL  CXC 138 11","3.0"},
                        {stdlib,"ERTS  CXC 138 10","3.0"},
                        {kernel,"ERTS  CXC 138 10","5.0"}]},
 {os,{unix,linux}},
 {erlang_version,"Erlang/OTP 19 [erts-8.0] [source] [64-bit] [async-threads:64] [hipe] [kernel-poll:true]\n"},
 {memory,[{total,55428728},
          {connection_readers,0},
          {connection_writers,0},
          {connection_channels,0},
          {connection_other,0},
          {queue_procs,2688},
          {queue_slave_procs,0},
          {plugins,0},
          {other_proc,18316352},
          {mnesia,57752},
          {mgmt_db,0},
          {msg_index,43744},
          {other_ets,923232},
          {binary,18864},
          {code,17682673},
          {atom,752561},
          {other_system,17630862}]},
 {alarms,[]},
 {listeners,[{clustering,25672,"::"},{amqp,5672,"::"}]},
 {vm_memory_high_watermark,0.4},
 {vm_memory_limit,417654374},
 {disk_free_limit,50000000},
 {disk_free,17928224768},
 {file_descriptors,[{total_limit,1048476},
                    {total_used,2},
                    {sockets_limit,943626},
                    {sockets_used,0}]},
 {processes,[{limit,1048576},{used,135}]},
 {run_queue,0},
 {uptime,230},
 {kernel,{net_ticktime,60}}]

To Restart the VM:
==================
The command to restart the VM is "docker-machine restart machine-name"
ex:
$ docker-machine restart default
$ docker-machine restart vmfordocker
