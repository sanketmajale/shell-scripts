#!/bin/bash

read -p "Enter Username:" username

if [ "$username" = "sanket" ];
then
      echo "username already exist"
else
      sudo adduser $username 
      echo "$username User crteated"
fi






