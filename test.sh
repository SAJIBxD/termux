#!/data/data/com.termux/files/usr/bin/bash

function install_zsh() {
	if ! [ -x "$(command -v zsh)" ]; then
		echo -e "\\e[32m[ zsh ]\\e[m not found, installing"
		apt-get install -y zsh >/dev/null 2>&1
	fi
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		echo -e "\\e[32m[ oh-my-zsh ]\\e[m clonning repository"
		git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1 --quiet >/dev/null
	else
		if ask "\\e[32m[ oh-my-zsh ]\\e[m configs found, overwrite?" Y; then
			rm -rf "$HOME/.oh-my-zsh"
			git clone git://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh" --depth 1 --quiet >/dev/null
		fi
	fi
	curl -fsLo "$HOME/.oh-my-zsh/themes/lambda-mod.zsh-theme" https://cdn.rawgit.com/onlurking/termux/master/.termux/lambda-mod.zsh-theme
	curl -fsLo "$HOME/.zshrc" https://cdn.rawgit.com/onlurking/termux/master/.termux/.zshrc
	curl -fsLo "$HOME/.profile" https://cdn.rawgit.com/onlurking/termux/master/.termux/.profile
	if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
		if ask "\\e[32m[ oh-my-zsh ]\\e[m enable syntax highlighting?" Y; then
			echo -e "\\e[32m[ oh-my-zsh ]\\e[m downloading plugin"
			git clone git://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" --quiet >/dev/null
		fi
	else
		sed -i '4s/.*/plugins=(git)/' "$HOME/.zshrc"
	fi

	if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then
		if ask "\\e[32m[ oh-my-zsh ]\\e[m enable autosuggestions?" Y; then
			echo -e "\\e[32m[ oh-my-zsh ]\\e[m downloading plugin"
			git clone git://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" --quiet >/dev/null
			sed -i '4s/git/git zsh-autosuggestions/' "$HOME/.zshrc"
		fi
	fi

	chsh -s zsh

}
