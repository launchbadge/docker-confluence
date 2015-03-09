# https://registry.hub.docker.com/u/phusion/baseimage/
FROM phusion/baseimage:latest
MAINTAINER launchbadge <contact@launchbadge.com>

# Install base system requirements
RUN apt-get update && \
    apt-get install -q -y \
      git-core \
      curl \
      software-properties-common \
      python-software-properties

# Install Java 8
RUN apt-add-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install oracle-java8-installer -y

# Install Confluence
ENV CONFLUENCE_VERSION 5.7.1
VOLUME ["/data"]
RUN curl -Lks http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${CONFLUENCE_VERSION}.tar.gz -o /root/confluence.tar.gz && \
    mkdir /opt/confluence && \
    tar zxf /root/confluence.tar.gz --strip=1 -C /opt/confluence && \
    echo "confluence.home = /data" > /opt/confluence/confluence/WEB-INF/classes/confluence-init.properties && \
    rm -rf /root/confluence.tar.gz

# Configure start
WORKDIR /opt/confluence
EXPOSE 8090
ADD start.sh /start.sh
CMD ["/start.sh"]
