FROM centos:latest

ENV DOCKER_COMPOSE_VERSION 1.8.0
ENV COMMAND_OPTIONS ""

WORKDIR /tmp

ADD oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
ADD oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm
ADD oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

RUN useradd -r -g root jenkins
RUN yum update -y 
RUN yum install -y python3 git bash unzip wget
RUN yum install -y /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
RUN yum install -y /tmp/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm
RUN yum install -y /tmp/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

WORKDIR /

RUN mkdir -p /home/jenkins \
  && chown jenkins /home/jenkins

COPY swarm.jar /home/jenkins/swarm.jar

COPY run.sh /run.sh
RUN chmod +x /run.sh

#CMD ["/run.sh"]
