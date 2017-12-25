pulling and running a mysql containers:
=======================================

source: https://hub.docker.com/_/mysql/

$ docker pull mysql

$ docker run --name ashu-mysql -e MYSQL_ROOT_PASSWORD=Ashish@123 -d mysql:latest

$ docker run -it --link ashu-mysql:mysql --rm mysql sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

