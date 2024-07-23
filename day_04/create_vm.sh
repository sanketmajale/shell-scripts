#!/bin/bash
set -euo pipefail


function azcli-installation() {

if ! command -v az &> /dev/null; then
	echo "Azure CLI (az) could not be found Installing Az Cli"
	install-azcli
fi

}

function install-azcli() {
	
	echo "**************** Installing Az Cli ***************"

	sudo apt-get update

	# Create a new sources file with the correct format
	echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ jammy main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

	# Add the Microsoft GPG key
	curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null

	# Update the package list and install the Azure CLI
	sudo apt-get update
	sudo apt-get install -y azure-cli

}

function create-vm() {
	
	echo "************* VM Creation Started *************"
	# Create Vm Using Az Cli Commmands
	az vm create \
	--resource-group $1 \
	--name $2 \
	--image $3 \
	--size $4 \
	--admin-username $5 \
	--admin-password $6 \
	--generate-ssh-keys		

	echo "************ VM Created Successfully ***********"
}

function vm-status-check() {

	# Initialize VM status variable
	VM_STATUS="unknown"

	# Check VM status in a loop
	while [ "$VM_STATUS" != "PowerState/running" ]; do
  
	# Get the current VM status
  	VM_STATUS=$(az vm get-instance-view --resource-group $RESOURCE_GROUP --name $VM_NAME  --query "instanceView.statuses[1].code" --output tsv)
  
  	# Print the current VM status
  	echo "******************* Current VM status: $VM_STATUS **************************"
  
  	# If the VM is not running, wait for 10 seconds before checking again
  	if [ "$VM_STATUS" == "running" ]; then
   		echo "************* Virtual Machine Is Running ************"
		sleep 10 
 		break 
	fi
	done

	# Print message when VM is running
	echo "VM is running."	

}


function main() {

	# Declare Env	
	RESOURCE_GROUP="vm-rg"
	VM_NAME="shell-script-vm"
	IMAGE="Ubuntu2204"
	SIZE="Standard_B1s"
	ADMIN_USERNAME="azureuser"
	ADMIN_PASSWORD="Mypassword@123"

	#Call Function and pass Env
	create-vm "$RESOURCE_GROUP" "$VM_NAME" "$IMAGE" "$SIZE" "$ADMIN_USERNAME" "$ADMIN_PASSWORD"

}


#Function Calling

azcli-installation

main

vm-status-check

echo "**************** VM Creation Completed *******************"


