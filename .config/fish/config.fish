if status is-interactive
    # Commands to run in interactive sessions can go here
end
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

#---------------------------------------------
# Global variables
#---------------------------------------------

# XDG user directories
set -x XDG_CACHE_HOME  $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME   $HOME/.local/share
set -x XDG_STATE_HOME  $HOME/.local/state
# clean the $HOME directory
set -x HISTFILE "$XDG_STATE_HOME"/bash/history
set -x _Z_DATA "$XDG_DATA_HOME"/z
set -x XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority
set -x WINEPREFIX "$XDG_DATA_HOME"/wine
set -x TEXMFVAR "$XDG_CACHE_HOME"/texlive/texmf-var
set -x RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -x BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -x BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set -x BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle
set -x PYLINTHOME "$XDG_CACHE_HOME"/pylint
set -x PYENV_ROOT "$XDG_DATA_HOME"/pyenv
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME"/pass
set -x PARALLEL_HOME "$XDG_CONFIG_HOME"/parallel
set -x _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -x NVM_DIR "$XDG_DATA_HOME"/nvm
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -x __GL_SHADER_DISK_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -x NUGET_PACKAGES "$XDG_CACHE_HOME"/NuGetPackages
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -x TERMINFO "$XDG_DATA_HOME"/terminfo
set -x TERMINFO_DIRS "$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
set -x MPLAYER_HOME "$XDG_CONFIG_HOME"/mplayer
set -x ICEAUTHORITY "$XDG_CACHE_HOME"/ICEauthority
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -x GOPATH "$XDG_DATA_HOME"/go
set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -x GEM_HOME "$XDG_DATA_HOME"/gem
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -x CARGO_HOME "$XDG_DATA_HOME"/cargo


alias :q='exit'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias dots='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
starship init fish | source
