#!/data/data/com.termux/files/usr/bin/sh

pkg remove game-repo
pkg remove science-repo
pkg upgrade
# Required packages
pkg install -y git python fzf zsh rsync termux-api termux-tools ncurses-utils openssl-tool
# Optinal packages
pkg install -y vim ranger

# Storare permission
termux-setup-storage

# Pip packages
pip install -U youtube-dl

# Git repos
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Change default shell to ZSH
chsh -s zsh

# Dotfiles
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/HossainRizbi/termux.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
