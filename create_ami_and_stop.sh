#!/bin/bash

#Pega a instancia pela tag nome
id_instancia=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query 'Reservations[].Instances[].InstanceId' | tr -d '"' | tr -d '[' | tr -d ']')

# Cria a imagem
aws ec2 create-image --instance-id $id_instancia --name "$1_$(date +%F)" --description "$1" --no-reboot

if [ $? -eq 0 ]
then
# Desliga a instancia
 
    aws ec2 stop-instances --instance-ids $id_instancia
else
    echo "Favor colocar o nome correto da instância"
fi