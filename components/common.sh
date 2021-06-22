#!/bin/bash

HEAD() {
      echo -e "\e[1m$1\e[0m \t\t ..."
}
STAT() {
  if [ $1 -eq 0 ]
  then
  echo -e "\e[1;31mdone......\e[0m"
  else
  echo -e "\e[1;31mFail.....\e[0m"
  echo -e "\e[1;33mcheck the logs for more details..... logfile: /tmp/logs\e[0m"
  exit 1
  fi
}