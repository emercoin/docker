#!/bin/bash

FILE=/root/.emercoin/emercoin.conf
new_pass=$1
old_pass=$(cat $FILE | grep "rpcpassword" | cut -d'=' -f2)

if [ "$new_pass" == "" ]; then
  echo "Пароль не может быть пустым!"
  exit 1
fi
if [ "$new_pass" == "$old_pass" ]; then
  echo "Пароль тот же " "$old_pass"
  exit 0
 else
   echo "Пароль сменен" "$new_pass"
   path=rpcpassword=$new_pass
   sed -i "s#.*rpcpassword.*#$path#g" $FILE
   exit 0
fi

