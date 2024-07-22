#!/bin/bash

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









