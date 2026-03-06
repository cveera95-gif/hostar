FROM tomcat:9

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/myapp.war /usr/local/tomcat/webapps/

CMD ["catalina.sh","run"]
