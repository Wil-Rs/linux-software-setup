
# cria a pasta para colocar as fontes
mkdir ~/.fonts

# faz download na fonts
wget -P ~/.fonts 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/BitstreamVeraSansMono.zip' 

# extrai e add as fonte na pasta ~/.fonts
unzip ~/.fonts/BitstreamVeraSansMono.zip -d ~/.fonts

# instalando outra font obs: add essa fonte nas config do terminal
sudo apt install fonts-firacode -y

# baixando o thema powerlevel10k para o zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# alterar no ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"

# comando para configurar e mudar as coisas do thema
p10k configure