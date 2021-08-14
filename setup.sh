#!/bin/bash

clear 

#this script will configure and install startup packages

echo -e """
\e[1;33mTermux Setup\e[1m 
"""

cd $HOME

echo -e '\e[1;36m installing basic apps...\e[1m'

pkg update && pkg upgrade 

pkg install -y git

pkg install -y neovim termux-api

#setting desktop 
cp -rf $HOME/termux/.config $HOME

termux-setup-storage
ln -s $HOME/storage/music $HOME/Music
