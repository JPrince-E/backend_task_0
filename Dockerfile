#
# Build stage
#
FROM maven:3.8.2-jdk-11 AS build
COPY . .
#RUN mvn clean package -DskipTests
RUN mvn clean
RUN mvn install

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /target/*.jar backend_task_0.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","breej.jar"]