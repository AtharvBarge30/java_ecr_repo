# Use a base image with OpenJDK
FROM maven:3.6.1-jdk-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package

FROM tomcat:9.0.72
COPY --from=build /app/target/*.jar /usr/local/tomcat/webapps/ROOT.jar


EXPOSE 8080
#
## Specify the command to run the application
#ENTRYPOINT ["java", "-jar","app.jar"]

# Use a base image with Java pre-installed
#FROM openjdk:8-jdk-alpine
#
## Set the working directory inside the container
#WORKDIR /app
#
## Copy the Maven project directory contents (including the pom.xml file) into the container at /app
#COPY . /app
#
## Build the application using Maven
#RUN ./mvnw package
#
## Set the entry point to run the Spring Boot application when the container starts
#ENTRYPOINT ["java", "-jar", "/app/target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar"]

#atharv
##shubhsm