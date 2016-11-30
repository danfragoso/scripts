#!/bin/bash
#menu
set -b

printf " 1:Compactar arquivos de uma pasta \n 2:Copiar arquivos entre pastas \n 3:Mover arquivos entre pastas \n 4:Concatenar arquivos específicos de uma pasta \n 5:Buscar um texto dentro de arquivos de uma pasta \n 6:Matar processo de programa específico em execução \n 7:Buscar arquivo em pasta \n 8:Executar script específico \n 9:Concatenar arquivos depois compactar e mover para pasta específica \n 10:Fazer busca de arquivo e mostrar última data de alteração \n"
read OPT

if [ "$OPT" == "1" ]; then

	echo "Digite o caminho da pasta"
	read CAM
	tar -czvf $CAM.tar.gz $CAM

elif [ "$OPT" == "2" ]; then

	echo "Digite o nome do arquivo de origem"
	read NAM1
	echo "Digite o nome do arquivo de destino"
	read NAM2
	cp $NAM1 $NAM2


elif [ "$OPT" == "3" ]; then

	echo "Digite o nome do arquivo de origem"
	read NAM1
	echo "Digite o nome do arquivo de destino"
	read NAM2
	mv $NAM1 $NAM2

elif [ "$OPT" == "4" ]; then

	echo "Digite o nome do arquivos para serem concatenados"
	IFS= read -r NAM1
	echo "Digite o nome do arquivo final"
	read NAM2
	cat ""$NAM1"" > $NAM2

elif [ "$OPT" == "5" ]; then

	echo "Digite o texto que voce deseja procurar"
	IFS= read -r NAM1
	echo "Digite o nome do arquivo no qual voce deseja procurar"
	read NAM2
        grep --color=auto "$NAM1" $NAM2

elif [ "$OPT" == "6" ]; then
	echo "Digite o nome do processo"
	read NAM1
	killall -9 $NAM1

elif [ "$OPT" == "7" ]; then
	echo "Digite o nome do arquivo ou use wildcard"
	read NAM1
	echo "Digite o diretorio"
	read NAM2
	find $NAM2 -name $NAM1

elif [ "$OPT" == "8" ]; then
	echo "Digite o nome do script"
	read NAM1
	bash ./$NAM1

elif [ "$OPT" == "9" ]; then
	echo "Digite o nome do arquivos para serem concatenados"
	IFS= read -r NAM1
	echo "Digite o nome do arquivo final"
	read NAM2
	echo "Digite o diretorio final"
	read PASTA
	cat ""$NAM1"" > $NAM2
        tar -czvf $NAM2.tar.gz $NAM2
	mv $NAM2.tar.gz $PASTA/$NAM2.tar.gz

elif [ "$OPT" == "10" ]; then
	echo "Digite o nome do arquivo ou use wildcard"
	read NAM1
	echo "Digite o diretorio da busca"
	read NAM2
	OUT=$(find $NAM2 -name $NAM1)
	echo "O arquivo "$NAM1 "foi modificado pela ultima vez em:"
	date -r $OUT

fi
