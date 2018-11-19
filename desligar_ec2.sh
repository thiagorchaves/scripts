#!/bin/bash

#Pega a instancia pela tag nome
nome_instancia=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query 'Reservations[].Instances[].InstanceId' | tr -d '"' | tr -d '[' | tr -d ']')

if [ $? -eq 0 ]
then
# Desliga a instancia
 
    aws ec2 stop-instances --instance-ids $nome_instancia
else
    echo "Favor colocar o id da instância"
fi