# Use a base image with a JRE (Java Runtime Environment)
FROM openjdk:8-jre-slim

# Set a working directory
WORKDIR /app

# Copy the JAR file into the container
COPY target/calculator-app-1.0-SNAPSHOT.jar calculator-app.jar

# Expose the port your application listens on (if applicable)
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "calculator-app.jar"]
