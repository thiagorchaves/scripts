#!/bin/bash

caminho_restore="/home/thiago/restore_amazon"
aws s3 sync s3://teste-mysql-backup/$(date +%F) $caminho_restore

cd $caminho_restore
if [ -f $1 ]
then
    mysql -u root multilidae < $1
    if [ $? -eq 0 ]
    then
        echo "Restore executado com sucesso"
    fi
else
    echo "O arquivo não existe"
fi