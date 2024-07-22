#!/bin/bash

function azcli-installation() {

if ! command -v az &> /dev/null; then
	echo "Azure CLI (az) could not be found Installing Az Cli"
	install-azcli
fi

}

function install-azcli() {

	sudo apt-get update
#	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

#	sudo mkdir -p /etc/apt/keyrings
#	curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null 
#	sudo chmod go+r /etc/apt/keyrings/microsoft.gpg



	# Create a new sources file with the correct format
	echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ jammy main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

	# Add the Microsoft GPG key
	curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null

	# Update the package list and install the Azure CLI
	sudo apt-get update
	sudo apt-get install -y azure-cli



#	AZ_DIST=$(lsb_release -cs)
#	echo "Types: deb
#	URIs: https://packages.microsoft.com/repos/azure-cli/
#	Suites: ${AZ_DIST}
#	Components: main
#	Architectures: $(dpkg --print-architecture)
#	Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
	
	sudo apt-get update
	sudo apt-get install -y azure-cli


}

azcli-installation










