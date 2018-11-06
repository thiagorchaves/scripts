#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')

memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')

relacao_mat=$(bc <<< "scale=2;$memoria_consumida/$memoria_total * 100" | awk -F. '{ print $1 }')

memoria_livre=$(free -h | grep -i mem | awk '{ print $3 }')

if [ $relacao_mat -gt 40 ]
then 
mail -s "Consumo alto de memória" thiago@qcx.com.br<<del
O consumo de memoria está acima do limite, o consumo de memoria é de $memoria_livre 
del
fi
