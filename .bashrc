#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s autocd

C_RED="$(tput setaf 1)"
C_BOLD="$(tput bold)"
C_INV="$(tput rev)"
C_RESET="$(tput sgr0)"

PS1='\[${C_RED}${C_INV}\] \u \[${C_BOLD}\] \w › \[${C_RESET}\] '

# set default editor
export EDITOR='nvim'
export VISUAL='nvim'

if [ -d "$HOME/.local/bin" ]
then
	PATH="$HOME/.local/bin:$PATH";
fi

# bookmarks
source ~/.config/bash/bookmarks.sh

# command aliases
source ~/.config/bash/aliases.sh

# some creds
source ~/.config/bash/creds.sh

# useful bash functions
source ~/.config/bash/functions.sh