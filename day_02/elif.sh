#!/bin/bash

read -p "Enter Age:" age

if [ $age -ge 0 ] && [ $age -le 18 ];
then
	echo "You are not able to vote"
elif [ $age -ge 18 ] && [ $age -le 100 ];
then
	echo "You can able to vote"
else
	echo "Your Entered age is wrong" 
fi

 

 



