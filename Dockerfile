# # Base image
# FROM maven:3.8.5-openjdk-11-slim as builder

# # Set working directory
# WORKDIR /app

# # Copy Maven project files
# COPY pom.xml .

# # Build the Maven project
# RUN mvn clean install -DskipTests

# # Stage for SonarQube Scan
# FROM maven:3.8.5-openjdk-11-slim

# # Set working directory
# WORKDIR /app

# # Copy built project from builder stage
# COPY --from=builder /app .

# # SonarQube parameters
# ENV SONAR_HOST_URL="http://your-sonarqube-server:9000"
# ENV SONAR_LOGIN="your-sonar-token"

# # Run SonarQube scan
# CMD ["mvn", "sonar:sonar", "-Dsonar.host.url=$SONAR_HOST_URL", "-Dsonar.login=$SONAR_LOGIN"]








#--------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Use an appropriate base image
# FROM ubuntu:20.04

# # Add a non-root user
# RUN adduser --uid 10001 --disabled-password --gecos "" cpqnonrootuser

# # Change ownership of directories, including /etc (This will cause an error in Jenkins)
# RUN chown -R cpqnonrootuser /usr && \
#     chown -R cpqnonrootuser /var && \
#     chown -R cpqnonrootuser /etc

# # Switch to the non-root user
# USER cpqnonrootuser

# Expose any necessary ports (if applicable)
# EXPOSE 8080

# Define the command to run the application
# CMD ["nginx", "-g", "daemon off;"]


# #---------------------------------------------------------------------------------------------------------------------------------------
FROM alpine:latest

# Set repository URLs
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/v3.18/main\nhttp://dl-cdn.alpinelinux.org/alpine/v3.18/community" > /etc/apk/repositories

# Update and install necessary packages
RUN apk update && apk upgrade --no-cache && apk add --no-cache curl wget bash doas unzip libstdc++ openssl

# Test script
CMD ["sh"]

#-------------------------------------------------------------------------------------------------------------------------
# # ARG BASE_IMAGE
# # ARG APP_VERSION

# # FROM ${BASE_IMAGE}

# # Use the APP_VERSION argument
# #ENV APP_VERSION=${APP_VERSION}

# # Use an official Python runtime as a parent image
# FROM python:3.9-slim

# # Set the working directory in the container
# WORKDIR /app

# # Copy the current directory contents into the container at /app
# COPY . /app

# # # Install any needed packages specified in requirements.txt
# # RUN pip install --no-cache-dir -r requirements.txt

# # Make port 80 available to the world outside this container
# EXPOSE 80

# # Define environment variable
# ENV NAME World

# # Run app.py when the container launches
# CMD ["python", "app.py"]
