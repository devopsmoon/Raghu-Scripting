#!/bin/bash

HELLO() {
  if [ $1 -eq 0 ]
  then
      echo -e "\e[1;33m$1\e[0m"
      fi
}
STATS() {
  if [ $? -eq 0 ]
  echo -e "\e[1;31m done......\e[0m"
  echo -e "\[1;33m fail..... check the logs for more details\e[0m"
  fi
}