# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run: 
#      $ docker build --pull -t oracle/instantclient:12.2.0.1 .
#
#
#FROM oraclelinux:7-slim

#FROM registry.redhat.io/openshift3/jenkins-slave-base-rhel7

#ADD oracle-instantclient*.rpm /tmp/

#RUN  yum -y install /tmp/oracle-instantclient*.rpm && \
 #    rm -rf /var/cache/yum && \
#     echo /usr/lib/oracle/12.2/client64/lib > /etc/ld.so.conf.d/oracle-instantclient12.2.conf && \
#     ldconfig

#ENV PATH=$PATH:/usr/lib/oracle/12.2/client64/bin

#CMD ["sqlplus", "-v"]
FROM registry.redhat.io/openshift3/jenkins-slave-base-rhel7 

#ENV DOCKER_COMPOSE_VERSION 1.8.0
#ENV COMMAND_OPTIONS ""

WORKDIR /tmp

ADD oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm /tmp/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
ADD oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm /tmp/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm
ADD oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm /tmp/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm

RUN useradd -r -g root jenkins
RUN yum -y update


RUN alien -i /tmp/oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
RUN alien -i /tmp/oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm
RUN alien -i /tmp/oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm

#RUN rm -R /tmp/oracle-instantclient*


RUN mkdir -p /home/jenkins \
  && chown jenkins /home/jenkins

#COPY swarm.jar /home/jenkins/swarm.jar

#COPY run.sh /run.sh
#RUN chmod +x /run.sh

#CMD ["/run.sh"]
