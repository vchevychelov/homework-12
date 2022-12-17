FROM alpine:3.16
RUN apk add git && \
    apk add openjdk11 && \
    apk add maven
RUN mkdir /webapps/ && \
git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git && \
mvn -f /App42PaaS-Java-MySQL-Sample/pom.xml clean package && \
cp /App42PaaS-Java-MySQL-Sample/target/hello-1.0.war /webapps/