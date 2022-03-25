#!/bin/bash

# Nome OpenPorts

# Autor: Pedro Otávio
# Email: pedr_ofs@hotmail.com
# Atualizado: 24/03/2022

# Este script realiza a abertura automática de portas e aguarda conexões.
# Utilize-o em conjunto com o script fwbypass.sh para obter resultados.

# Instrui ao usuário o modo de uso.
if [ "$1" == "" ];
then
	echo -e "\n              MODO DE USO"
	echo -e "\nPortas comuns: $0 comuns"
	echo -e "\nEscolha de portas: $0 53 80 443..."

# Verifica se o usuário pretende utilizar o modo padrão
elif [ "$1" == "comuns" ];
then

	# Array de portas comuns.
	comuns=("20" "21" "22" "23" "25" "53" "80" "110" "123" "135" "136" "137" "138" "139" "143" "156" "161" "162" "389" "443" "989" "990" "1723" "1863" "3128" "3389")

	# Loop para percorrer o array de portas comuns.
	for i in "${comuns[@]}"
	do
		# Comando para abrir as portas em background.
		nc -vnlp "$i"&
		sleep 1
	done

	# Comando para exibir as portas abertas.
	ss -nlpt
else
	# Loop para percorrer o array de portas inseridas pelo usuário.
	for i in "$@"
	do

		# Comando para abrir as portas em background.
		nc -vnlp "$i"&
		sleep 1
	done

	# Comando para exibir as portas abertas.
	ss -nlpt
fi
