#!/bin/bash
# Author:
# Date:
# Description:
# Modified Date:

source  components/common.sh
HEAD "Updating system"
yum update -y
STAT $?
yum install epel-release -y
STAT $?
yum update -y
STAT $?
HEAD "Installing nginx server"
yum install nginx -y
STAT $?
HEAD "Removing the old HTDOCS"
rm -rf /usr/share/nginx/html/*
STAT $?
HEAD "download the source code for github"
curl -s -L -o /tmp/frontend.zip "https://dev.azure.com/DevOps-Batches/ce99914a-0f7d-4c46-9ccc-e4d025115ea9/_apis/git/repositories/db389ddc-b576-4fd9-be14-b373d943d6ee/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
STAT $?
HEAD "moving to HTDOCS"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
mv /usr/share/nginx/html/static/* /usr/share/nginx/html/
mv /usr/share/nginx/localhost.conf /etc/nginx/default.d/roboshop.conf
rmdir /usr/share/nginx/html/static
HEAD "Starting nginx service"
systemctl start nginx
systemctl enable nginx
STAT $?


