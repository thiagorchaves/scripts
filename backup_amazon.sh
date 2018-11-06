#!/bin/bash

caminho_backup=/home/thiago/backup_amazon

cd $caminho_backup
data=$(date +%F)

if [ ! -d $data ]
then
    mkdir $data
fi

tabelas=$(mysql -u root  multilidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
    mysqldump -u root multilidae $tabela > $caminho_backup/$data/$tabela.sql
done

aws s3 sync $caminho_backup s3://teste-mysql-backup