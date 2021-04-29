#!/bin/bash

docker build --tag taurus227/docker-biserver-ce:9.1 .
docker container run --detach --name bi2 --publish 8081:8081 taurus227/docker-biserver-ce:9.1
