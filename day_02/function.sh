#!/bin/bash


function username_check(){

read -p "Enter Username:" username

read -p "Enter Password:" password

if [[ $username == "admin" && $password == "admin@123" ]]; then 
 
	echo "username & password is correct"

elif [[ $username == "admin" ]]; then

	echo "username is correct & password is wrong"

elif [[ $password == "admin@123" ]]; then 

	echo "password is correct & username is wrong"

else
	echo "username & password is wrong"
fi

}

#Function Call 

username_check



