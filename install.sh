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

# criando um grupo
sudo addgroup dev
# add user ao grupo
sudo adduser $USER dev

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

# instalando o mysql
sudo apt-get install mysql-server -y

sleep 1

echo "#######################################################";
echo "################### Instalando git ####################";
echo "#######################################################";

# instalando o git
sudo apt-get install git -y

# instalando o git flow
sudo apt-get install git-flow -y

sleep 1

echo "#######################################################";
echo "################ Instalando PHP 8.3 ###################";
echo "#######################################################";

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.3 -y
sudo apt install php8.3-common php8.3-mysql php8.3-xml php8.3-xmlrpc php8.3-curl php8.3-gd php8.3-imagick php8.3-cli php8.3-dev php8.3-imap php8.3-mbstring php8.3-opcache php8.3-soap php8.3-zip php8.3-intl -y

sleep 1

echo "#######################################################";
echo "############### Instalando composer ###################";
echo "#######################################################";

# instalando composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

sleep 1

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
code --install-extension eamodio.gitlens
code --install-extension codingyu.laravel-goto-view

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
echo "################# Instalando apache ###################";
echo "#######################################################";

# instalando apache
sudo apt-get install apache2 -y
sudo a2enmod rewrite # habilitando a reescrita

sleep 1

echo "#######################################################";
echo "################## Instalando nvm ####################";
echo "#######################################################";

# instalando nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

sleep 1

echo "#######################################################";
echo "################ Instalando discord ###################";
echo "#######################################################";

# instalando discord
wget -c "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo dpkg -i discord.deb

sleep 1

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
echo "Não esquece de arrumar a senha do mysql com \nALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'senha_aqui'; | gedit -

echo "#######################################################";
echo "################ INSTALAÇAO FINALIZADA ################";
echo "#######################################################";

