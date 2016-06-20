# docker-biserver-ce
Pentaho BI server(community edition) docker image for development and testing purposes. https://hub.docker.com/r/zhicwu/biserver-ce/

## What's inside
```
ubuntu:14.04
 |
 |--- zhicwu/java:8
       |
       |--- zhicwu/biserver-ce:latest
```
* Official Ubuntu Trusty(14.04) docker image
* Oracle JDK 8 latest release
* [Pentaho BI Server Community Edition](http://community.pentaho.com/) 6.1.0.1-196 with plugins and patches:
 * [BTable](https://sourceforge.net/projects/btable/)
 * [Community Text Editor](http://www.webdetails.pt/ctools/cte/)
 * [D3 Component Library](https://github.com/webdetails/d3ComponentLibrary)
 * Up-to-date JDBC drivers: [Apache Drill](http://drill.apache.org/docs/using-the-jdbc-driver/) 1.6.0, [MySQL Connector/J](http://dev.mysql.com/downloads/connector/j/) 5.1.39, [jTDS](https://sourceforge.net/projects/jtds/) 1.3.1,  [Presto](https://prestodb.io/docs/current/installation/jdbc.html) 0.148 and [Cassandra JDBC Driver](https://github.com/zhicwu/cassandra-jdbc-driver) 0.6.1
 * [Saiku](http://community.meteorite.bi/) - enabled SaikuWidgetComponent in CDE
 * [XMLA Provider](https://sourceforge.net/projects/xmlaconnect/) 1.0.0.103 - download from Help -> Document popup and install on your windows box

## Known issues
* You need to patch Presto's JDBC driver so that it works with PDI and Mondiran

## How to use
- Pull the image
```
# docker pull zhicwu/biserver-ce
```
- Setup scripts
```
# git clone https://github.com/zhicwu/docker-biserver-ce.git
# cd docker-biserver-ce
# chmod +x *.sh
```
- Edit biserver-env.sh and/or put your Pentaho configuration files under ext directory
- Start BI Server
```
# ./start-biserver.sh
# docker logs -f bi
```
You can now access the BI server via http://localhost:8080.

## How to build
```
# git clone https://github.com/zhicwu/docker-biserver-ce.git
# cd docker-biserver-ce
# chmod +x *.sh
# docker build -t zhicwu/biserver-ce .
```
