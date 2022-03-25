FROM ubuntu:latest
MAINTAINER "Sam"
RUN apt-get update -y
RUN apt-get install wget -y
RUN apt-get install openjdk-8-jdk -y
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.76/bin/apache-tomcat-8.5.76.tar.gz .
RUN tar -xzf apache-tomcat-8.5.76.tar.gz
RUN mv apache-tomcat-8.5.76 tomcat
WORKDIR /tomcat/webapps/
COPY ./Calendar.war /tomcat/webapps
CMD ["/tomcat/bin/catalina.sh","run"]
