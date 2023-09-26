#
# Docker image for Pentaho Server Community Edition.
#

FROM openjdk:8

# Set maintainer
MAINTAINER Robert Mikes <robert@mikes.hu>

# Set environment variables
ENV SERVER_VERSION=9.1.0.0-324

# Set label
LABEL java_server="Pentaho Server $SERVER_VERSION Community Edition"

COPY foo pentaho-server-ce-* /opt/
RUN cd /opt \
    && (ls -l pentaho-server-ce-${SERVER_VERSION}.zip && echo 'NO NEED TO DOWNLOAD') || wget --timeout=10 --waitretry=2 --tries=50 --retry-connrefused --progress=dot:giga https://sourceforge.net/projects/pentaho/files/Pentaho%209.1/server/pentaho-server-ce-${SERVER_VERSION}.zip \
    && unzip *.zip \
    && rm *.zip \
    && cd pentaho-server \
    && rm promptuser.sh \
    && sed -i 's/startup.sh/catalina.sh run/' start-pentaho.sh

EXPOSE 8080

WORKDIR /opt/pentaho-server
ENTRYPOINT ./start-pentaho.sh

