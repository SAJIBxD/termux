
#!/data/data/com.termux/files/usr/bin/sh

pkg upgrade
# Required packages
pkg install -y git python fzf zsh rsync termux-api termux-tools ncurses-utils openssl-tool
# Optinal packages
pkg install -y mpd mpc ncmpcpp cava vim ranger starship file yt-dlp eza

# Storare permission
termux-setup-storage

# Pip packages
# pip install -U yt-dlp

# Git repos
# Oh-My-Zsh install
ZDOTDIR=$HOME/.config/zsh \
ZSH=$HOME/.config/zsh/oh-my-zsh \
RUNZSH=no \
CHSH=no \
KEEP_ZSHRC=yes \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ZSH plugins
ZSH_CUSTOM=$HOME/.config/zsh/oh-my-zsh/custom
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Change default shell to ZSH
chsh -s zsh

# Dotfiles
git clone --separate-git-dir=$HOME/.cfg https://github.com/SAJIBxD/termux.git tmpdotfiles
# Copy all files except the .git folder
cp -a tmpdotfiles/. "$HOME/"
mv .zshrc $HOME/.config/zsh/

# Cleanup
rm -rf tmpdotfiles
