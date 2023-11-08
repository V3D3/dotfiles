#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -laF'
alias quit='exit'

C_BLACK="\e[30m"
C_RED="$(tput setaf 1)"
C_BOLD="$(tput bold)"
C_INV="$(tput rev)"
C_RESET="$(tput sgr0)"

# PS1='\[$(retval=$?;tput cup "$LINES";exit $retval)\]${C_RED}${C_INV} \u ${C_BOLD}\w › ${C_RESET} '
PS1='\[${C_RED}${C_INV}\] \u \[${C_BOLD}\] \w › \[${C_RESET}\] '

# set default editor
export EDITOR='nvim'
export VISUAL='nvim'

if [ -d "$HOME/.local/bin" ]
then
	PATH="$HOME/.local/bin:$PATH";
fi

# nnn themeing
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# bookmarks
source ~/.config/bash/bookmarks.sh

# command aliases
source ~/.config/bash/aliases.sh

# some creds
source ~/.config/bash/creds.sh

# useful bash functions
source ~/.config/bash/functions.sh

# MAGICAL piece of snake
export PATH="/usr/local/lib:$PATH"

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

