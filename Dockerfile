FROM alpine:latest AS builder
RUN apk add git && \
    apk add openjdk8 && \
    apk add maven && \
    git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git && \
    echo -e 'app42.paas.db.username = acp4pogynvaeidfj\napp42.paas.db.port = 3306\napp42.paas.db.password = jc31d2qyy7h9jv5jn1u9uosjksxzaizw\napp42.paas.db.ip = mysql\napp42.paas.db.name = dd' > /App42PaaS-Java-MySQL-Sample/WebContent/Config.properties && \
    mvn -f /App42PaaS-Java-MySQL-Sample/pom.xml clean package

FROM alpine:latest
WORKDIR / && mkdir webapps config
COPY --from=builder /App42PaaS-Java-MySQL-Sample/WebContent/Config.properties /config/
COPY --from=builder /App42PaaS-Java-MySQL-Sample/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /webapps/