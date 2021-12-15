#!/bin/sh

SCRIPT_DIR=$(pwd)

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		RESET=""
	fi
}

setup () {
  pkg update && pkg upgrade 
  pkg install -y git htop neofetch fzf neovim termux-api
  termux-setup-storage
  
echo "${BLUE}Stroage Permission Granted${RESET}"
} 
install_mpd () {
  pkg i mpd ncmpcpp
}

install_zsh_and_ohmyzsh () {
  pkg install zsh
  echo "${BLUE} Zsh Installed ${RESET}"
  # Change default shell to ZSH
  chsh -s zsh
  echo "${BLUE}Cloning Oh My Zsh...${RESET}"
  # Install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  echo "${BLUE}Cloning Zsh Plugins...${RESET}"
  # Install zsh-autosuggestions plugin
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  # Install zsh-syntax-highlighting plugin
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  
  #add plugins to zshrc
  sed -i 's/\(^plugins=([^)]*\)/\1 zsh-autosuggestions zsh-syntax-highlighting/' ~/.zshrc
}

install_other_dependencies () {
  echo "${BLUE}Installing Python... ${RESET}"
  pkg install python
  echo "${BLUE}Updating Pip...${RESET}"
  python -m pip install --upgrade pip
  echo "${BLUE}Installing YouTube Downloader...${RESET}"
  pip install youtube-dl
}

copy_files_and_create_dirs () {
  #mpd setup
  mkdir -p /data/data/com.termux/files/usr/var/run/
  mkdir -p ~/.config/mpd/playlists
  echo "${GREEN}MPD Setup completed${RESET}"
  cp -rf $SCRIPT_DIR/.config $HOME
  echo "${GREEN}Config Restored${RESET}"
  cp -rf $SCRIPT_DIR/bin $HOME
}
setup_color
setup
install_mpd
install_zsh_and_ohmyzsh
install_other_dependencies
copy_files_and_create_dirs

cat << EOF
__        __   _                             _                        
\ \      / /__| | ___ ___  _ __ ___   ___   | |
 \ \ /\ / / _ \ |/ __/ _ \| '_ \` _ \ / _ \ | |
  \ V  V /  __/ | (_| (_) | | | | | |  __/  | |
   \_/\_/ \___|_|\___\___/|_| |_| |_|\___|  (_)
EOF
exit 0
