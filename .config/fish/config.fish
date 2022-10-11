if status is-interactive
    # Commands to run in interactive sessions can go here
set fish_greeting
set -Ua fish_user_paths $HOME/.local/bin
fish_vi_key_bindings
set fish_cursor_default line
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set -U __done_min_cmd_duration 5000

alias :q='exit'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
starship init fish | source
end
