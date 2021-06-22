#!/bin/bash
# Author:
# Date:
# Description:
# Modified Date:
source components/common.sh
HEAD "Updating system"
yum update -y && yum install epel-release -y && yum update -y
STAT $?
HEAD "Installing nodejs server"
yum install nodejs make gcc-c++ -y
STAT $?
HEAD "Add roboshop user app"
id roboshop
if [ $? -eq 0 ]
then
  echo "User is already exists"
  STAT $?
  else
    useradd -d /home/roboshop -m -s /bin/bash
    STAT $?
    fi
    mkdir -p /home/roboshop/catalogue/
    HEAD "download the source code from github"
    curl -s -L -o /tmp/catalogue.zip "https://dev.azure.com/DevOps-Batches/ce99914a-0f7d-4c46-9ccc-e4d025115ea9/_apis/git/repositories/558568c8-174a-4076-af6c-51bf129e93bb/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
    STAT $?
    cd /home/roboshop/catalogue/
    unzip -o /tmp/catalogue.zip
    STAT $?
    npm install
    STAT $?
