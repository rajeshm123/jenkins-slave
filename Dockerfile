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

ADD oracle-instantclient*.rpm /tmp/

RUN  yum -y install /tmp/oracle-instantclient*.rpm && \
     rm -rf /var/cache/yum && \
     rm -f /tmp/oracle-instantclient*.rpm && \
     echo /usr/lib/oracle/12.2/client64/lib > /etc/ld.so.conf.d/oracle-instantclient12.2.conf && \
     ldconfig

ENV PATH=$PATH:/usr/lib/oracle/12.2/client64/bin

CMD ["sqlplus", "-v"]
