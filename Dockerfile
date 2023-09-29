# Pull base image 
From tomcat:8-jre8

# Maintainer 
MAINTAINER "support@gmail.com" 
COPY ./target/webapp.war /usr/local/tomcat/webapps

