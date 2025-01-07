FROM tomcat:9-jdk11-openjdk-slim
ENV CATALINA_HOME /usr/local/tomcat
ENV CATALINA_BASE /usr/local/tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./register-form.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]

