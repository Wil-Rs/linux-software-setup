#!/bin/bash

echo "#######################################################";
echo "#################### ATUALIZANDO... ###################";
echo "#######################################################";
echo "";

sleep 1

# atualizando lists
sudo apt-get update -y
# atualizando os pacotes
sudo apt-get upgrade -y

echo "#######################################################";
echo "################ EXECUTANDO INSTALAÇAO ################";
echo "#######################################################";
echo "";

sleep 1

folder="folder_instalation_wil_setup"

if [ ! -d "$folder" ]; 
then
	echo "Criando a pasta de instalação";
	mkdir "$folder"
else
	echo "A pasta existe continuando";
fi
cd "$folder"

echo "#######################################################";
echo "############## Instalando chrome google ###############";
echo "#######################################################";

sleep 1

# baixando e instalando o google chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chome.deb
sudo dpkg -i google-chome.deb

echo "#######################################################";
echo "################## Instalando mysql ###################";
echo "#######################################################";

sleep 1

echo "#######################################################";
echo "################### Instalando git ####################";
echo "#######################################################";

sleep 1

# instalando o git
sudo apt-get install git -y

# instalando o mysql
sudo apt-get install mysql-server -y

echo "#######################################################";
echo "################## Instalando vscode ##################";
echo "#######################################################";

sleep 1

# instalando o vscode
wget -c "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb
sudo dpkg -i vscode.deb

echo "#######################################################";
echo "############ Instalando vscode extensões ##############";
echo "#######################################################";

sleep 1

# instalando extensoes do vscode
code --install-extension mattedesign.laravel-pack
code --install-extension usernamehw.errorlens
code --install-extension PKief.material-icon-theme
code --install-extension natqe.reload

echo "#######################################################";
echo "################# Instalando dbeaver ##################";
echo "#######################################################";

sleep 1

# instalando dbeaver
wget -c https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb -O dbeaber.deb
sudo dpkg -i dbeaber.deb

# removendo a pasta criada
rm -R "$folder"

# Copia as configurações de monitores para o GDM +- defini o login no monitor principal
sudo cp .config/monitors.xml /var/lib/gdm3/.config/ #pop_os #ubuntu #debian

echo "#######################################################";
echo "################### Instalando zsh ####################";
echo "#######################################################";

sleep 1

# instalando o zsh
sudo apt-get install zsh -y

zsh --version

# definindo o zsh como padrao
chsh -s $(which zsh)

echo "#######################################################";
echo "################ Instalando Oh my zsh #################";
echo "#######################################################";

sleep 1

# instalando o oh my zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# baixando o autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# baixando o syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# add 
echo "Edite o arquivo .zshrc e add \nplugins=(git zsh-autosuggestions zsh-syntax-highlighting) \ndepois de um reboot na maquina" | gedit -

echo "#######################################################";
echo "################ INSTALAÇAO FINALIZADA ################";
echo "#######################################################";

