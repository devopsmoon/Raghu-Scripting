#!/bin/bash
# Author:
# Date:
# Description:
# Modified Date:
source components/common.sh
HEAD "Updating the system"
yum update -y
STAT $?
yum install epel-release -y
STAT $?
yum update -y
STAT $?
HEAD "Installing mongodb server"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $?
yum install mongodb-org -y
STAT $?
HEAD "Changing the ip in mongodb.conf"
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $?
HEAD "Starting mongodb services"
systemctl start mongod
systemctl enable mongod
STAT $?
HEAD "Download the schemas from github"
curl -s -L -o /tmp/mongodb.zip "https://dev.azure.com/DevOps-Batches/ce99914a-0f7d-4c46-9ccc-e4d025115ea9/_apis/git/repositories/e9218aed-a297-4945-9ddc-94156bd81427/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
cd /tmp
unzip /tmp/mongodb.zip
STAT $?
HEAD "loading the schemas into database"
mongo < catalogue.js
mongo < users.js
STAT $?

