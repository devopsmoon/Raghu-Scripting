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