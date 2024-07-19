#!/bin/bash


read -p "Enter Number:" number

while [ $number -lt 10 ]; 
do
	echo $number
	((number++))
done


