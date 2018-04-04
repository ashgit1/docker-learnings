#Docker Compose:
Combination of CLI and a configuration file.

Why:
1. configure relationships between containers
2. save our docker container run settings in easy-to-read file
3. create one liner developer environment startups

Comprised of 2 separate but related things:
1. yaml file that describes our solution options for:
	--> containers
	--> networks
	--> volumes

2. CLI called `docker-compose` used for local dev/test automation with those yaml files.


docker-compose.yml:
1. compose yaml format has its own version (1, 2, 2.1, 3, 3.1)
2. yaml file can be used with `docker-compose` command for local docker automation
3. with docker directly in production with swarm (as of v1.13)
4. docker-compose --help
5. docker-compose.yml is the default file name, with can be any file name and can be used with 
	`docker-compose -f file-name` 

docker-compose CLI:
1. It comes with docker for Mac/Windows, but separte download for Linux
2. Not a production-garde tool but ideal for local development and test
3. 2 most common commands are:
	--> docker-compose up    # set up volumes/networks and start all containers 
	--> docker-compose down  # stop containers and remove volumes/networks/container
4. If all your projects had a `Dockerfile` and `docker-compose.yml` 
	then "new developer onboarding"	will be
		--> git clone github.com/some/software
		--> docker-compose up
		