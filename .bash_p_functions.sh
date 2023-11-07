function selfhelp ()
{
	echo "Directory and file path aliases:";
	cat ~/.bash_p_bookmarks.sh
	echo "
Command aliases:";
	cat ~/.bash_p_aliases.sh
	echo "
Custom functions:
1. cdp <dirpath>: create and cd into a path
2. cdl <path>: cd into path and ls
3. bprog <filepath?> <alias>: create bookmark to current directory or file in it
4. palias <command> <alias>: create alias for program/command
5. mp3 <url>: grab mp3 from youtube-like url
6. convert <file> <new-extension>: convert a media file to a particular extension
7. convertrm <file> <new-extension>: convert a media file to a particlar extension, and remove the original
";
}

function cdp ()  {
	mkdir -p "$1" && cd "$1";
}

function cdl ()  {
	cd "$1" && ls;
}

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

function mp3 () {
	if [[ $# -ne 1 ]]
	then
		echo "usage: mp3 <url>"
		echo "fetches mp3 in current directory"
		return
	fi

    yt-dlp --ignore-errors -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o '%(title)s.%(ext)s' "$1"
}

function convert () {
	if [[ $# -ne 2 ]]
	then
		echo "usage: convert <inputfile> <output-extension>"
		return
	fi
	file="$1"
	file_without_ext="${file%.*}"
	ffmpeg -i "$1" "$file_without_ext.$2"
}

function convertrm () {
	if [[ $# -ne 2 ]]
	then
		echo "usage: convertrm <inputfile> <output-extension>"
		return
	fi
	convert "$1" $2
	rm "$1"
}