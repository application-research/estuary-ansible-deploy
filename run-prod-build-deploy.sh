#!/bin/bash

###################################################################
#Script Name	: run-prod-build-deploy.sh
###################################################################

TAG=$1
ansible-playbook -i prod/inventory.ini -k deploy-prod-api.yml --extra-vars "tag=$TAG"
ansible-playbook -i prod/inventory.ini -k deploy-prod-shuttle.yml --extra-vars "tag=$TAG"
