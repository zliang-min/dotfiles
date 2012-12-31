# Load zshuery
source ${HOME}/.zshuery/zshuery.sh
load_defaults
load_aliases
load_correction

alias ls='ls -G'
export LSCOLORS="Gxfxcxdxbxegedabagacad"

load_completion ${HOME}/.zshuery/completion

# Enable menu select
zstyle ':completion:*' menu select

# Enable tree view for kill completion
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'

# Modify zshuery correction prompt
SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Non-Gentoo users might configure their prompt manually.
# The default Gentoo prompt from above would look like this:
#PROMPT="%B%{$fg[green]%}%n@%m%k%{$reset_color%} %B%{$fg[blue]%}%1~ %# %b%f%k%{$reset_color%}"

# Set options
setopt complete_in_word
setopt path_dirs

# Load modules
# zmodload zsh/pcre
zmodload zsh/regex

# Update terminal CWD once and then on every CWD change
update_terminal_cwd
function chpwd() {
  update_terminal_cwd
}

# THEME
source $HOME/dotfiles/zsh/cloud.zsh-theme
# RVM stuff
source $HOME/.rvm/scripts/rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
