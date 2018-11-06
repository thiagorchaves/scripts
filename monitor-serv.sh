#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no Servidor" thiago@qcx.com.br<<del
Houve um problema no servidor e os usuários pararam e ter acesso ao conteudo web.
del

    systemctl restart apache2    

fi