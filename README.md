# docker-biserver-ce
Base docker image of Pentaho Server(community edition). https://hub.docker.com/r/zhicwu/biserver-ce/

## Hierarchy
```
ubuntu:16.04
  |
  |--- phusion/baseimage:0.9.22
    |
    |--- zhicwu/java:8
      |
      |--- taurus227/docker-biserver-ce:9.1
```
* Official Ubuntu 16.04 LTS docker image
* [Phusion Base Image](https://github.com/phusion/baseimage-docker) 0.9.22
* Oracle JDK 8u144
* [Pentaho BI Server Community Edition](http://community.pentaho.com/) 8.0.0.0-1

## Quick Start
```sh
$ docker run --name bi -p 8080:8080 -d taurus227/docker-biserver-ce:9.1
$ docker logs -f bi
```
Now you should be able to access Pentaho Server at http://localhost:8080

## How to Build
```sh
$ git clone https://github.com/peoplewareDo/docker-biserver-ce.git -b 9.1 --single-branch
$ cd docker-biserver-ce
$ docker build -t my/biserver:9.1 .
```

## How to Push
```sh
$ docker login
$ docker push taurus227/docker-biserver-ce:9.1
```

sudo docker build -t docker.peopleware.do:5000/biserver:9.0-base .
