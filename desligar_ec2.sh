#!/bin/bash

#Pega a instancia pela tag nome
id_instancia=$(aws ec2 describe-instances --filters "Name=instance-id,Values=$1" | grep $1 | awk '{ print $2 }' | tr -d '"' | tr -d ',')

nome_instancia=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$2" | grep $2 | awk '{ print $2 }' | tr -d '"' | tr -d ',')
 

# Cria a imagem
aws ec2 create-image --instance-id $($id_instancia) --name "$1_$(date +%F)" --description "$1" --no-reboot

if [ $? -eq 0 ]
then
# Desliga a instancia
 
    aws ec2 stop-instances --instance-ids $($id_instancia)
else
    echo "Favor colocar o id da instância"
fi