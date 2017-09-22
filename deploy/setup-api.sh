#!/bin/sh
# Build script
# set -o errexit

mkdir -p ../ansible/secrets
touch "../ansible/secrets/$ENV.yml"

ENV=staging
ORG=sunbird
ECHO_SERVER_VERSION=0.0.2-silver

# Deploy API Manager
echo "@@@@@@@@@ Deploy API Manager"
ansible-playbook -i ../ansible/inventory/$ENV ../ansible/deploy.yml --tags "stack-api-manager" --extra-vars "hub_org=${ORG} echo_server_image_name=echo-server echo_server_image_tag=${ECHO_SERVER_VERSION}"
