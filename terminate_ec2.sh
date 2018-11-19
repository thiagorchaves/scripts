#!/bin/bash

id_instancia=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" --query 'Reservations[].Instances[].InstanceId' | tr -d '"' | tr -d '[' | tr -d ']')

# Terminar Instancia
aws ec2 terminate-instances --instance-ids $id_instancia