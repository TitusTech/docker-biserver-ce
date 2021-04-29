#
# Docker image for Pentaho Server Community Edition.
#


# Set maintainer
MAINTAINER Robert Mikes <robert@mikes.hu>

# Set environment variables
ENV BISERVER_VERSION=9.1.0-324

# Set label
LABEL java_server="Pentaho Server $BISERVER_VERSION Community Edition"

RUN cd /opt \
    && wget --timeout=10 --waitretry=2 --tries=50 --retry-connrefused --progress=dot:giga https://sourceforge.net/projects/pentaho/files/Pentaho%209.1/server/pentaho-server-ce-9.1.0.0-324.zip \
    && ls -l \
    && unzip *.zip \
    && rm *.zip \
    && cd pentaho-server \
    && rm promptuser.sh \
    && ./set-pentaho-env.sh

#EXPOSE 8080

CMD ["/sbin/my_init", "--", "./start-pentaho.sh"]
