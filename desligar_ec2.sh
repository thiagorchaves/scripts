#!/bin/bash

#Pega a instancia pela tag nome

id_instancia=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query 'Reservations[].Instances[].InstanceId' | tr -d '"' | tr -d '[' | tr -d ']')


# Desliga a instancia
 
aws ec2 stop-instances --instance-ids $id_instancia

