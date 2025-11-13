# pom file uses JDK 11. Using JDK 17 in docker will cause mismatch of JDK
# FROM openjdk:17-jdk-slim

# Tried using this. Got 
# ERROR: docker.io/library/openjdk:11-jdk-slim: not found
# Looks lie this version of jdk is no longer dupported in Docker Hub
#FROM openjdk:11-jdk-slim

FROM eclipse-temurin:11-jdk-slim
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

# FROM maven:3.6.0-jdk-11-slim AS build
# COPY src /home/app/src
# COPY pom.xml /home/app
# RUN mvn -f /home/app/pom.xml clean package
#
# Package stage
#
# FROM eclipse-temurin:11-jre
# COPY --from=build /home/app/target/spring-boot-example-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
# RUN rm -rf /home/app
# EXPOSE 8080
#ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
