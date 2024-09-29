FROM node:latest

RUN apt update && apt upgrade -y

# Install AWS CDK and CLI
RUN npm install -g aws-cdk@latest && apt-get install awscli -y

# Install Git and Bash
RUN apt-get install git -y && apt-get install bash -y

# Install dependencies for adding repositories and installing JDK
RUN apt-get update && \
    apt-get install -y wget gnupg2 software-properties-common

# Add the Amazon Corretto repository
RUN wget -O- https://apt.corretto.aws/corretto.key | apt-key add - && \
    add-apt-repository 'deb https://apt.corretto.aws stable main'

# Install Amazon Corretto 21
RUN apt-get update && \
    apt-get install -y java-21-amazon-corretto-jdk \
    && apt-get install maven -y

# Install Docker
# See https://stackoverflow.com/questions/61401626/docker-installation-failed-on-ubuntu-20-04-ltsvmware
RUN apt-get install -y docker.io

# Add credentials for GitHub repository
COPY setCredentials.sh /data/setCredentials.sh
