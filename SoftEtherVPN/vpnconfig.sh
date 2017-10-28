#!/bin/bash

echo "========================================"

# set username
FILE_USERNAME=username.txt
if [ -z "${USERNAME}" ] && [ ! -f $FILE_USERNAME ];
then
  USERNAME=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w 8 | head -n 1)
  echo $USERNAME > $FILE_USERNAME
  echo "USERNAME is generated: $USERNAME"
else
  if [ ! -z "${USERNAME}" ];
  then
    echo $USERNAME > $FILE_USERNAME
  else
    USERNAME=$(head -n 1 $FILE_USERNAME)
  fi
  echo "USERNAME is found: $USERNAME"
fi

# set password
FILE_PASSWORD=password.txt
if [ -z "${PASSWORD}" ] && [ ! -f $FILE_PASSWORD ];
then
  PASSWORD=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w 20 | head -n 1)
  echo $PASSWORD > $FILE_PASSWORD
  echo "PASSWORD is generated: $PASSWORD"
else
  if [ ! -z "${PASSWORD}" ];
  then
    echo $PASSWORD > $FILE_PASSWORD
  else
    PASSWORD=$(head -n 1 $FILE_PASSWORD)
  fi
  echo "PASSWORD is found: $PASSWORD"
fi

echo "========================================"
