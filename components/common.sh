#!/bin/bash

HEAD() {
      echo -e "\e[1m$1\e[0m \t\t ..."
}
STAT() {
  if [ $1 -eq 0 ]
  then
  echo -e "\e[1;31m done......\e[0m"
  else
  echo -e "\e[1;31m Fail.....\e[0m"
  echo -e "\e[1;33m check the logs for more details..... logfile: /tmp/logs\e[0m"
  exit 1
  fi
}