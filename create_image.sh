#!/bin/bash

id_instancia=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query 'Reservations[].Instances[].InstanceId' | tr -d '"' | tr -d '[' | tr -d ']')

# Cria a imagem
aws ec2 create-image --instance-id $id_instancia --name "$1_$(date +%F)" --description "$1" --no-reboot

