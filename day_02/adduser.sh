#!/bin/bash


read -p "Enter Username:" username

sudo adduser $username

echo "Successfully added user:$username"
