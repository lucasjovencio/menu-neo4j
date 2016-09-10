#!/bin/sh
while true; do
	echo "Informe uma das opções abaixo\n[1] Instalar local de armazenamento DBS Neo4j\n[2] Instalar nova DataBase Neo4j\n[3] Escolher Database para Iniciar\n[4] Instalar Java 8\n[5] Interromper Instancia Rodando"
    read -p "" yn
    case $yn in
        [1]* ) 
			if [ -d "/home/DataBases_Neo4j/" ];then
			  echo "O diretório já existe e está pronto para receber novas istancias NEO4j"
			else
			  echo "diretório criado e preparado para receber novas instancias NEO4J"
			  sudo mkdir "/home/DataBases_Neo4j"
			fi
			;;
        [2]* ) 
			while true; do	
				echo "Informe um nome para a sua instancia NEO4J"
				read -p "" din
				if [ -d "/home/DataBases_Neo4j/"$din ]; then
					echo "Nome de instancia já existe, tenta com outro nome."
					else
						cd /home
						sudo wget http://neo4j.com/artifact.php?name=neo4j-community-3.0.0-unix.tar.gz && 
						sudo tar -zxvf artifact.php\?name\=neo4j-community-3.0.0-unix.tar.gz && 
						sudo mv neo4j-community-3.0.0 "/home/DataBases_Neo4j/"$din
						sudo rm -r "artifact.php?name=neo4j-community-3.0.0-unix.tar.gz"
						echo "Database Instalada com Sucesso"
						break;
				fi
			done
			;;
        [3]* )
        	cd  "/home/DataBases_Neo4j/"
        	ls
			while true; do	
				echo "Informe o nome da Database Neo4j Instalada"
				read -p "" instan
				if [ -d "/home/DataBases_Neo4j/"$instan ]; then
					cd
					for D in /home/DataBases_Neo4j/*; do
					    if [ -d "${D}" ]; then
					        cd $D
					        sudo bin/neo4j stop
					    fi
					done
					cd "/home/DataBases_Neo4j/"$instan
					sudo bin/neo4j start
					echo "Database Iniciado"
					break;
					else
						echo "Database não existe, tente novamente"
				fi
			done
			;;
		[4]*)
			sudo add-apt-repository ppa:webupd8team/java
			sudo apt-get update
			sudo apt-get install oracle-java8-installer
			;;
		[5]*)
			cd
			for D in /home/DataBases_Neo4j/*; do
			    if [ -d "${D}" ]; then
			        cd $D
			        sudo bin/neo4j stop
			    fi
			done
			echo "Database interrompido."
			;;
		*);;
    esac
done