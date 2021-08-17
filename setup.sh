#!/bin/bash

clear 

#this script will configure and install startup packages

echo -e """
\e[1;33mTermux Setup\e[1m 
"""

cd $HOME

echo -e '\e[1;36m installing basic apps...\e[1m'

pkg update && pkg upgrade 

#zsh install & configuration
pkg install zsh 
chsh -s zsh

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

pkg install -y git htop neofetch fzf neovim termux-api

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Download zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

#Download zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

#installing python3
pkg install python
python -m pip install --upgrade pip
pip install youtube-dl

#setting desktop 
cp -rf $HOME/termux/.config $HOME

termux-setup-storage
ln -s $HOME/storage/music $HOME/Music

mv $HOME/termux/zshrc ~/.zshrc



#music player daemon
pkg i mpd ncmpcpp
mkdir -p /data/data/com.termux/files/usr/var/run/

