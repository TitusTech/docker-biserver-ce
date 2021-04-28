#
# Docker image for Pentaho BA server community edition.
#

FROM openjdk:8

WORKDIR /opt
RUN cd /opt \
    && wget --timeout=10 --waitretry=2 --tries=50 --retry-connrefused --progress=dot:giga https://sourceforge.net/projects/pentaho/files/latest/download
    && unzip pentaho-server-ce-*.zip \
    && cd pentaho-server \
    && ./set-pentaho-env.sh

WORKDIR /opt/pentaho-server
ENTRYPOINT ./start-pentaho.sh

