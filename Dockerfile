FROM ubuntu:16.04
RUN apt update && apt install curl -y
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.60/bin/apache-tomcat-8.5.60.ta$
RUN tar xvfz apache*.tar.gz
RUN apt install default-jdk maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ./boxfuse-sample-java-war-hello
RUN mvn package && cp ./target/hello-1.0.war /opt/tomcat/apache-tomcat-8.5.60/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/apache-tomcat-8.5.60/bin/catalina.sh", "run"]
