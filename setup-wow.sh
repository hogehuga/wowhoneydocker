#!/bin/sh

NATPORT=8080
LOGDIR=~/logs
CONTAINERNAME=wowhoney

docker pull hogehuga/wowhoney
docker run -d -p 8080:$NATPORT --mount type=bind,src=$LOGDIR,dst=/opt/wowhoney/wowhoneypot/log --name $CONTAINERNAME --hostname=$CONTAINERNAME hogehuga/wowhoney
