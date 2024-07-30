#!/bin/bash

function display_usage() {

	echo "This Script Use for Rotational Backup Pass Argumnets Following syntax"
	echo " ./rotational_backup.sh <Source-Path> <Backup-Folder-Path>"
	echo "$date_time"
}

	if [ $# == 0 ]; then
		display_usage
	fi


source_folder=$1
backup_folder=$2
date_time=$(date '+%Y-%m-%d-%H-%M-%S')

function backup() {

	zip -r "${backup_folder}/backup_${date_time}.zip" "${source_folder}"

	if [ $? == 0 ]; then
		echo "Copy $date_time file into Backup Folder Completed"
	fi

}


function rotational_backup() {

	backup=($(ls -t "${backup_folder}/backup_"*.zip))

	#echo "${backup[@]}"

	if [ ${#backup[@]} > 5 ]; then
		echo "Delete files beacuse backup have is more than 5 Days Backup"

		files_to_delete=("${backup[@]:5}")

		#echo "${files_to_delete[@]}"
		
		for files in "${files_to_delete[@]}";
		do	
			rm -f ${files}
		done
	fi
}



backup

rotational_backup













