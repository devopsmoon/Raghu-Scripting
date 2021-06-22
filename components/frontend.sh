#!/bin/bash
# Author:
# Date:
# Description:
# Modified Date:

source  components/common.sh
HEAD "Updating system"
yum updatee -y
STAT $?

