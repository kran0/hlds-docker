run docker-compose w/ env variables
MYSQL_USER=root MYSQL_PASSWD=password MYSQL_DB=cs docker-compose up -d

run MYSQL Docker:
docker run -d -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=cs -p 3306:3306 mysql:5.6

# CS 1.6 didicated server in Docker !

Docker container for CS 1.6 LAN server.
Makes running CS 1.6 lan server extremely easy with just a few commands on any linux box.

## What is inside?

HLDS with cstrike (installed using official steamcmd).
Plus: Metamod, AMXmod and Dproto

## How to use?

Connect to the server in CS client terminal:

```
connect $server_ip; password secret
```

1. Run with docker-compose (simplest):

```bash
cd /opt/my/server/dir/
curl -o ./docker-compose.yaml https://github.com/kran0/hlds-docker/raw/master/docker-compose.yaml
docker-compose up -d

# stop with:
# docker-compose down
```

2. Run without docker-compose:

```bash
docker run -d --name cstrike\
 -p 26900:26900/udp\
 -p 27020:27020/udp\
 -p 27015:27015/udp\
 -p 27015:27015\
 -e GAME="cstrike"\
 -e MAXPLAYERS="8"\
 -e START_MAP="de_dust2"\
 -e SERVER_NAME="Counter-Strike 1.6 Server"\
 -e START_MONEY="800"\
 -e BUY_TIME="0.25"\
 -e FRIENDLY_FIRE="1"\
 -e RESTART_ON_FAIL="1"\
 -e SERVER_PASSWORD="secret"\
 -e RCON_PASSWORD="supersecret"\
 kran0/hlds:latest
```

## How to build?

Please watch my [Automated builds](https://hub.docker.com/r/kran0/hlds/tags/).

| Repository:Tag    | Build description                                             |
| ----------------- | ------------------------------------------------------------- |
| kran0/hlds:latest | latest stable                                                 |
| kran0/hlds:tag    | [Tag](https://github.com/kran0/hlds-docker/releases) releases |

Build with command: "`docker build -t kran0/hlds:latest .`".
You need Docker 17.05 or higher on the daemon and client to use multistage builds.
