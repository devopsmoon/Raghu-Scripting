#!/bin/bash

HELLO() {
      echo -e "\e[1m$1\e[0m \t\t ..."
}
STATS() {
  if [ $? -eq 0 ]
  then
  echo -e "\e[1;31m done......\e[0m"
  echo -e "\[1;33m fail..... check the logs for more details\e[0m"
  fi
}