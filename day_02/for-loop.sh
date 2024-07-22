#!/bin/bash

read -p "Enter folder name:" fname

for ((i=1; i<=10; i++)); 
do
	mkdir "$fname$i"
done







