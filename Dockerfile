# Build Stage
FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app

# Copy project files
COPY . .

# Build the application
RUN mvn clean install -DskipTests

# Package Stage
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copy the JAR from the build stage
COPY --from=build /app/target/*.jar backend_task_0.jar

# Expose the application port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "backend_task_0.jar"]
