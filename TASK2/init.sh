#!/bin/sh

PORT=$1
img=$2

docker-compose down
docker rm -f $img

docker network create bmc-net
docker-compose up -d
docker build -t $img .
docker run -it --network=bmc-net --name $img -p $PORT:22 $img