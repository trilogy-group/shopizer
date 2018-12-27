FROM ubuntu:16.04

ARG mysql_root_password=root
ARG mysql_database=SALESMANAGER
ARG mysql_user=shopizer
ARG mysql_password=shopizer

ENV MYSQL_ROOT_PASSWORD=$mysql_root_password
ENV MYSQL_DATABASE=$mysql_database
ENV MYSQL_USER=$mysql_user
ENV MYSQL_PASSWORD=$mysql_password
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV M2_HOME  /usr/share/maven

RUN apt-get update \ 
    && apt-get install -y software-properties-common openjdk-8-jdk maven git vim nano net-tools \
    && rm -rf /var/lib/apt/lists/*  \
    && add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe' \ 
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.6 mysql-client-5.6 \
    && chown -R mysql:mysql /var/run/mysqld

COPY entrypoint.sh /entrypoint.sh

RUN chmod u+x /entrypoint.sh

EXPOSE 8080 3306

ENTRYPOINT ["./entrypoint.sh"]
