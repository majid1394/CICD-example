FROM tomcat: 8.0.53
COPY target/spring-idea-sample.war /usr/local/tomcat/webapps
CMD["/usr/local/tomcat/bin/catalina.sh","run"]
