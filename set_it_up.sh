#!/bin/sh

SCRIPT_DIR=$(pwd)

setup () {
  pkg update && pkg upgrade 
  pkg install -y git htop neofetch fzf neovim termux-api
  termux-setup-storage
}

install_mpd () {
  pkg i mpd ncmpcpp
}

install_zsh_and_ohmyzsh () {
  pkg install zsh
  
  # Change default shell to ZSH
  chsh -s zsh
  
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  
  # Install zsh-autosuggestions plugin
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Install zsh-syntax-highlighting plugin
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

install_other_dependencies () {
  pkg install python
  python -m pip install --upgrade pip
  pip install youtube-dl
}

copy_files_and_create_dirs () {
  #mpd setup
  mkdir -p /data/data/com.termux/files/usr/var/run/
  mkdir -p ~/.config/mpd/playlists
  
  cp -rf $SCRIPT_DIR/.config $HOME
}

setup
install_mpd
install_zsh_and_ohmyzsh
install_other_dependencies
copy_files_and_create_dirs

cat << EOF
__        __   _                               _                          _
\ \      / /__| | ___ ___  _ __ ___   ___     | |__   ___  _ __ ___   ___| |
 \ \ /\ / / _ \ |/ __/ _ \| '_ \` _ \ / _ \    | '_ \ / _ \| '_ \` _ \ / _ \ |
  \ V  V /  __/ | (_| (_) | | | | | |  __/    | | | | (_) | | | | | |  __/_|
   \_/\_/ \___|_|\___\___/|_| |_| |_|\___|    |_| |_|\___/|_| |_| |_|\___(_)
EOF
exit 0
