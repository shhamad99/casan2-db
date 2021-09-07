FROM maven:latest AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:14
COPY --from=build /usr/src/app/target/spring-boot-cassandra-0.0.1-SNAPSHOT.jar /usr/app/spring-boot-cassandra-0.0.1-SNAPSHOT.jar
WORKDIR /usr/app
EXPOSE 9003
ENTRYPOINT ["java","-jar","spring-boot-cassandra-0.0.1-SNAPSHOT.jar"]
