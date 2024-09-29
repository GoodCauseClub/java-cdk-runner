FROM node:latest

# Install dependencies
RUN apt-get update && apt-get install -y wget gnupg2 software-properties-common

# RUN apt update && apt upgrade -y

# Install AWS CDK and CLI
RUN npm install -g aws-cdk@latest && apt-get install awscli -y

# Install Git and Bash
RUN apt-get install git -y && apt-get install bash -y

# Install java-common and other dependencies
RUN apt-get install -y java-common

# Download and install Amazon Corretto 21
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.deb && \
    dpkg -i amazon-corretto-21-x64-linux-jdk.deb && \
    rm amazon-corretto-21-x64-linux-jdk.deb

# Install Maven
RUN apt-get install maven -y

# Install Docker
RUN apt-get install -y docker.io

# Add credentials for GitHub repository
COPY setCredentials.sh /data/setCredentials.sh
