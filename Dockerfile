FROM alpine:3.16
RUN apk add git && \
    apk add openjdk11 && \
    apk add maven
RUN mkdir /webapps/ && \
git clone https://github.com/vchevychelov/homework-12.git && \
mvn -f /App42PaaS-Java-MySQL-Sample/pom.xml clean package && \
cp /App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /webapps/