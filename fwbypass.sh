#!/bin/bash

# Nome: fwbypass - Firewall Bypass

# Autor: Pedro Otávio
# Email: pedr_ofs@hotmail.com
# Atualizado: 24/03/2022

	#==================================== ATENÇÃO!!! ===================================#
	#           O AUTOR DESTE SCRIPT NÃO SE RESPONSABILIZA PELO SEU MAL USO!            #
	#===================================================================================#

# Este script tem por finalidade verificar as portas permitidas para o tráfego de saída de um deteminado host.
# Utilize-o em conjunto com o script abreportas.sh.

# IMPORTANTE: Execute o script openports.sh antes da execução do script fwbypass.sh.

# Instrui ao usuário o mode de uso.
if [ "$1" == "" ];
then
	# Instrui o modo de uso ao usuário.
	echo -e "              MODO DE USO"
	echo -e "\nPortas padrão: $0 192.168.0.10 comuns"
	echo -e "\nEscolha de portas: $0 192.168.0.10 53 80 443..."

# Verifica se o usuário pretende usa o modo padrão.
elif [ "$2" == "comuns" ];
then

	# Array de portas comuns.
	comuns=("20" "21" "22" "23" "25" "53" "80" "110" "123" "135" "136" "137" "138" "139" "143" "156" "161" "162" "389" "443" "989" "990" "1723" "1863" "3128" "3389")

	# Loop para percorrer o array de portas comuns.
	for i in "${comuns[@]}"
	do

		# Pula o primeiro argumento.
		if [ "$i" == "$1" ];
		then
			continue
		fi

		# Realiza a conexão e verifica se houve sucesso.
		timeout 2 bash -c ">/dev/tcp/$1/$i" && echo "Conexão via porta $i"

		sleep 1
	done

# Modo de definição de portas pelo usuário.
else

	# Loop para percorrer o array de portas inseridas pelo usuário.
	for i in "$@"
	do

		# Pula o primeiro argumento.
		if [ "$i" == "$1" ];
		then
			continue
		fi

		# Realiza a conexão e verifica se houve sucesso.
		timeout 2 bash -c ">/dev/tcp/$1/$i" && echo "Conexão via porta $i"

		sleep 1
	done
fi
