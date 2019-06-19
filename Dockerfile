FROM oraclelinux:7-slim
ARG version="19.2.0"

RUN mkdir -p /opt/oracle
ADD ./pgx-${version}-server.zip /opt/oracle/pgx_server.zip

RUN yum install -y vim wget java-1.8.0-openjdk.x86_64 unzip && \
    rm -rf /var/cache/yum/* && \
    yum clean all

RUN unzip /opt/oracle/pgx_server.zip -d /opt/oracle && \
    rm /opt/oracle/pgx_server.zip && \
    mv /opt/oracle/pgx-${version} /opt/oracle/pgx-server

ADD ./conf/server.conf /opt/oracle/pgx-server/conf/server.conf
ADD ./conf/pgx.conf /opt/oracle/pgx-server/conf/pgx.conf 
RUN mkdir -p /opt/oracle/pgx-server/working_dir

ARG groovy_version="2.5.6"
RUN wget https://bintray.com/artifact/download/groovy/maven/apache-groovy-binary-$groovy_version.zip -O groovy.zip && \
    unzip groovy.zip -d /opt/ && \
    rm groovy.zip 
ENV GROOVY_HOME=/opt/groovy-$groovy_version

EXPOSE 7007
CMD ["sh", "/opt/oracle/pgx-server/bin/start-server"]

