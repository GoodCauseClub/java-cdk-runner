FROM node:latest

RUN apt update && apt upgrade -y

# Install AWS CDK and CLI
RUN npm install -g aws-cdk@2.41.0 && apt-get install awscli -y

# Install Git and Bash
RUN apt-get install git -y && apt-get install bash -y

# Install Java
RUN apt-get install openjdk-17-jdk -y && apt-get install maven -y

# Install Docker
# See https://stackoverflow.com/questions/61401626/docker-installation-failed-on-ubuntu-20-04-ltsvmware
RUN apt-get install -y docker.io

# Add credentials for GitHub repository
COPY setCredentials.sh /data/setCredentials.sh
