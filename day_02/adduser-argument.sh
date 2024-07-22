#!/bin/bash

#read -p "Take user from argumnent:" $1

echo "Create New User:$1"

sudo adduser $1

echo "New User created $1"


