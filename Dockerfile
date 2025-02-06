FROM alpine:latest

# Set repository URLs
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/v3.18/main\nhttp://dl-cdn.alpinelinux.org/alpine/v3.18/community" > /etc/apk/repositories

# Update and install necessary packages
RUN apk update && apk upgrade --no-cache && apk add --no-cache curl wget bash doas unzip libstdc++ openssl

# Test script
CMD ["sh"]


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
