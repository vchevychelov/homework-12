FROM alpine:latest AS builder
RUN apk add git && \
    apk add openjdk8 && \
    apk add maven && \
    git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git && \
    mvn -f /App42PaaS-Java-MySQL-Sample/pom.xml clean package

FROM alpine:latest
WORKDIR / && mkdir /webapps/
COPY --from=builder /App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /webapps/