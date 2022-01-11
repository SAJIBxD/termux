#!/data/data/com.termux/files/usr/bin/bash

### FUNCTIONS ###
function install_zsh() {
	if ! [ -x "$(command -v zsh)" ]; then
		echo -e "\\e[32m[ zsh ]\\e[m not found, installing"
		apt-get install -y zsh >/dev/null 2>&1
	fi
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		echo -e "\\e[32m[ oh-my-zsh ]\\e[m clonning repository"
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >/dev/null
	else
		if ask "\\e[32m[ oh-my-zsh ]\\e[m configs found, overwrite?" Y; then
			rm -rf "$HOME/.oh-my-zsh"
			sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >/dev/null
		fi
	fi
	
	if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] && [ ! -d "${ZSH:-~/.oh-my-zsh}/plugins/zsh-syntax-highlighting" ]; then
		if ask "\\e[32m[ oh-my-zsh ]\\e[m enable syntax highlighting?" Y; then
			echo -e "\\e[32m[ oh-my-zsh ]\\e[m downloading plugin"
			git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting --quiet >/dev/null
		fi
	else
		#sed -i '4s/.*/plugins=(git)/' "$HOME/.zshrc"
	fi

	if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] && [ ! -d "${ZSH:-~/.oh-my-zsh}/plugins/zsh-autosuggestions" ]; then
		if ask "\\e[32m[ oh-my-zsh ]\\e[m enable autosuggestions?" Y; then
			echo -e "\\e[32m[ oh-my-zsh ]\\e[m downloading plugin"
			git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions --quiet >/dev/null

			#sed -i '4s/git/git zsh-autosuggestions/' "$HOME/.zshrc"
		fi
	fi

	 chsh -s zsh

}
install_zsh
