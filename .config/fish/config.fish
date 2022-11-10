set fish_greeting
set -Ua fish_user_paths $HOME/.local/bin
fish_vi_key_bindings
set fish_cursor_default line
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set -U __done_min_cmd_duration 5000

function up
    curl -s https://0x0.st -F "file=@$argv" | termux-clipboard-set && termux-toast "Link copied to clipboard" 
end

bind -M insert qq exit

alias :q='exit'
alias xdl="wget -r --no-parent --reject 'index.html*'"
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
starship init fish | source
