#!/bin/bash
#set -euo pipefail

function clone-code() {
        if [[ -d react_django_demo_app ]]; then
                echo "*******Repo alreday Exist********"
                echo "*******CD Directory to project********"
                cd react_django_demo_app
                echo "*******Checkout Main Brach********"
                git checkout main
                echo "*******Git Pull Latest Changes********"
                git pull
		cd react_django_demo_app 
        else
                echo "*******Clonning Repository********"
                git clone https://github.com/sanketmajale/react_django_demo_app.git
                echo "********CD Directory to project*******"
                cd react_django_demo_app
                echo "********Checkout Main Brach*******"
                git checkout main
                echo "********Git Pull Latest Changes*******"
                git pull
        fi
}
function install-required-software() {
        echo "**********Installing Required Softwares***************"
        sudo apt-get update 
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io
	sudo curl -L "https://github.com/docker/compose/releases/download/v2.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version

#	sudo apt-get install -y docker.io 
#	sudo apt-get install -y docker-compose


}

function restart-services() {
	echo "************ Restart Service ************"
#	sudo usermod -aG docker $USER
#	newgrp docker
	sudo systemctl enable docker
	sudo systemctl restart docker

}

function deploy-app() {
	echo "******************** Deploy App ********************"	
	docker build --no-cache -t react-djano-app:1 .	
	echo "******************** App Running *******************"
	docker run -p 8001:8001 -d react-djano-app:1 

} 

function send-email() {

# Set variables
TO_ADDRESS="sanketmajale@mailinator.com"
SUBJECT="Deployment Failed"
BODY="React Django Application Deployment Failed Please check logs."
CC_ADDRESS="sanketmajale1008@gmail.com"

# Use sendmail to send the email
sendmail $TO_ADDRESS <<EOF
subject:$SUBJECT
from:react-django-app-vm@devlopment.com
cc:$CC_ADDRESS
$BODY
EOF

}

#Call Function

if ! clone-code; then
	echo "Code clone failed"
	exit 1
fi

if ! install-required-software; then
	echo "Software Installation Failed"
	exit 1
fi

if ! restart-services; then
	echo "service restart fault"
	exit 1
fi

if ! deploy-app; then 
	echo "Deployment failed, mailing to the admin"
	send-email 
	exit 1
fi

