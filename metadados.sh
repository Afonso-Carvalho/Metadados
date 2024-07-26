#!/bin/bash

function banner {

echo -e "\033[36m
 ██████╗  ██████╗  ██████╗  ██████╗ ██╗     ███████╗    ██╗  ██╗ █████╗  ██████╗██╗  ██╗██╗███╗   ██╗ ██████╗
██╔════╝ ██╔═══██╗██╔═══██╗██╔════╝ ██║     ██╔════╝    ██║  ██║██╔══██╗██╔════╝██║ ██╔╝██║████╗  ██║██╔════╝
██║  ███╗██║   ██║██║   ██║██║  ███╗██║     █████╗      ███████║███████║██║     █████╔╝ ██║██╔██╗ ██║██║  ███╗
██║   ██║██║   ██║██║   ██║██║   ██║██║     ██╔══╝      ██╔══██║██╔══██║██║     ██╔═██╗ ██║██║╚██╗██║██║   ██║
╚██████╔╝╚██████╔╝╚██████╔╝╚██████╔╝███████╗███████╗    ██║  ██║██║  ██║╚██████╗██║  ██╗██║██║ ╚████║╚██████╔╝
 ╚═════╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝
                                                    ██████╗ ██╗   ██╗    ███████╗ ██████╗ ██╗██████╗ ██╗   ██╗
                                                    ██╔══██╗╚██╗ ██╔╝    ██╔════╝██╔════╝ ██║██╔══██╗██║   ██║
                                                    ██████╔╝ ╚████╔╝     █████╗  ██║  ███╗██║██████╔╝██║   ██║
                                                    ██╔══██╗  ╚██╔╝      ██╔══╝  ██║   ██║██║██╔══██╗██║   ██║
                                                    ██████╔╝   ██║       ███████╗╚██████╔╝██║██║  ██║╚██████╔╝
                                                    ╚═════╝    ╚═╝       ╚══════╝ ╚═════╝ ╚═╝╚═╝  ╚═╝ ╚═════╝
\033[0m"

}


function opcoes {

opcao=4

while [ $opcao -gt 3 ]
do
 clear
 banner

 echo -e "
 Operações:

 1 - Pesquisa em todos operadores.
 2 - Pesquisa livre
 3 - Analise de Metadados

 "

 read -p "Escolha o numero da operação desejada: " opcao

done

}

# 1 opção

function alloperator {

banner

read -p "Digite o que deseja pesquisar: " pesquisa
read -p "Numero maximo de links desejado: " links

site=$(lynx --dump "https://google.com/search?&q=site:$pesquisa" | grep "http" | cut -d "=" -f2 | egrep -v "site|google" | grep -v "upv" | grep "http" | head -n $links)
intitle=$(lynx --dump "https://google.com/search?&q=intitle:$pesquisa" | grep "http" | cut -d "=" -f2 | egrep -v "intitle|google" | grep -v "upv" | grep "http" | head -n $links)
inurl=$(lynx --dump "https://google.com/search?&q=inurl:$pesquisa" | grep "http" | cut -d "=" -f2 | egrep -v "inurl|google" | grep -v "upv" | grep "http" | head -n $links)
intext=$(lynx --dump "https://google.com/search?&q=intext:$pesquisa" | grep "http" | cut -d "=" -f2 | egrep -v "intext|google" | grep -v "upv" | grep "http" | head -n $links)
filetype=$(lynx --dump "https://google.com/search?&q=filetype:$pesquisa" | grep "http" | cut -d "=" -f2 | egrep -v "filetype|google" | grep -v "upv" | grep "http" | head -n $links)
ext=$(lynx --dump "https://google.com/search?&q=ext:$pesquisa" | grep "http" | cut -d "=" -f2 | egrep -v "ext|google" | grep -v "upv" | grep "http" | head -n $links)
cache=$(lynx --dump "https://google.com/search?&q=cache:$pesquisa" | grep "http" | cut -d "=" -f2 | egrep -v "cache|google" | grep -v "upv" | grep "http" | head -n $links)

echo -e "\nsite:"
echo "$site" | tr ' ' '\n'

echo -e "\nIntitle:"
echo "$intitle" | tr ' ' '\n'

echo -e "\nInurl:"
echo "$inurl" | tr ' ' '\n'

echo -e "\nIntext:"
echo "$intext" | tr ' ' '\n'

echo -e "\nFiletype:"
echo "$filetype" | tr ' ' '\n'

echo -e "\next:"
echo "$ext" | tr ' ' '\n'

echo -e "\ncache:"
echo "$cache" | tr ' ' '\n'

}

alloperator



