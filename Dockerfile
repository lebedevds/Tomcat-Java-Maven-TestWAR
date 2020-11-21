FROM tomcat:8.5.60-jdk8-adoptopenjdk-openj9
RUN apt update
RUN apt install maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR ./boxfuse-sample-java-war-hello
RUN mvn package && cp ./target/hello-1.0.war /usr/local/tomcat/webapps/
