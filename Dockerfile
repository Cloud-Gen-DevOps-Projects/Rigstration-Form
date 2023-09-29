# Pull base image 
From tomcat:8-jre8

# Maintainer 
MAINTAINER "support@gmail.com" 
COPY /root/.jenkins/workspace/war-build-1/webapp/target/webapp.war /usr/local/tomcat/webapps

