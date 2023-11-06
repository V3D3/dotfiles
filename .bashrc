#
# ~/.bashrc
#

# bookmarks
alias mail='xdg-open "https://mail.google.com"'


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

alias px='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias copy='xclip -sel clip'
alias shortprompt='export PS1="$ "'

function cdp ()  {
	mkdir -p "$1" && cd "$1";
}

function cdl ()  {
	cd "$1" && ls;
}

if [ -d "$HOME/.local/bin" ]
then
	PATH="$HOME/.local/bin:$PATH";
fi

# nnn themeing
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# bookmarks
source ~/.bash_p_bookmarks.sh

# command aliases
source ~/.bash_p_aliases.sh

# some creds
source ~/.bash_p_creds.sh

# MAGICAL piece of snake
export PATH="/usr/local/lib:$PATH"

function bprog ()
{
	if [ $# -lt 1 ]
	then
		echo "usage: bprog <./filepath?> <alias>";
		echo "creates: alias=<cd .> or <./filepath>";
		return;
	elif [ $# -lt 2 ]
	then
		location="$(pwd)"
		echo "alias $1='cd $location'" >> ~/.bash_p_bookmarks.sh
	elif [ $# -eq 2 ]
	then
		location="$(pwd)/$1"
		echo "alias $2='$location'" >> ~/.bash_p_bookmarks.sh
	fi
	source ~/.bashrc
}

function palias ()
{
	if [ $# -lt 2 ]
	then
		echo "usage: palias <command> <alias>";
		echo "creates: alias='command'";
		return;
	fi
	echo "alias $2='$1'" >> ~/.bash_p_aliases.sh
	source ~/.bashrc
}

function selfhelp ()
{
	echo "Directory and file path aliases:";
	cat ~/.bash_p_bookmarks.sh
	echo "
Command aliases:";
	cat ~/.bash_p_aliases.sh
	echo "
Custom functions:
1. bprog <filepath?> <alias>: create bookmark to current directory or file in it
2. palias <command> <alias>: create alias for program/command
3. mp3 <url>: grab mp3 from youtube-like url
4. fetchid <ip:port?>: sync identity with pi at ip:port";
}

mp3 () {
	if [[ $# -ne 1 ]]
	then
		echo "usage: mp3 <url>"
		echo "fetches mp3 in current directory"
		return
	fi

    yt-dlp --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s' "$1"
}

convert () {
	if [[ $# -ne 2 ]]
	then
		echo "usage: convert <inputfile> <output-extension>"
		return
	fi
	file="$1"
	file_without_ext="${file%.*}"
	ffmpeg -i "$1" "$file_without_ext.$2"
}

convertrm () {
	if [[ $# -ne 2 ]]
	then
		echo "usage: convertrm <inputfile> <output-extension>"
		return
	fi
	convert "$1" $2
	rm "$1"
}

# fetchid () {
# 	if [[ $# -eq 1 ]]
# 	then
# 		echo $PI_PASS > rsync -avz pi@$1:/home/pi/identity ~/Desktop
# 	else
# 		echo $PI_PASS > rsync -avz pi@pi.v:/home/pi/identity ~/Desktop
# 		echo $PI_PASS
# 	fi
# }

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

