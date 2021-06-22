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
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
cd /tmp
unzip /tmp/mongodb.zip /tmp
STAT $?
cd /tmp/mongodb-main
mongo < catalogue.js
mongo < users.js
STAT $?

