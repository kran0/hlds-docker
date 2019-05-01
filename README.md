# CS 1.6 in Docker !

Docker container for CS 1.6 LAN server. 
Makes running CS 1.6 lan server extremely easy. 
With yuse few commands on any linux box.

## What is inside?

Official HLDS with cstrike (installed with steamcmd).
Plus: Metamod, AMXmod and Dproto

## How to use?

1) Run with docker-compose (simplest):

```bash
cd /to/dir/with/docker-compose.yaml/
docker-compos up -d
```

2) Run without docker-compose:

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

| Repository:Tag | Build description  |
|---|---|
| kran0/hlds:latest | latest stable |
| kran0/hlds:<tag> | [Tag](https://github.com/kran0/hlds/releases) releases |

Build with command: "`docker-compose build`".
You need Docker 17.05 or higher on the daemon and client to use multistage builds.
