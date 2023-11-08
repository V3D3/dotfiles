bash : .bashrc ./.config/bash
	cp .bashrc ~/.bashrc
	cp .bash_profile ~/.bash_profile
	mkdir -p ~/.config/bash
	cp -a ./.config/bash/. ~/.config/bash/

zsh : bash .

tmux : ./.config/tmux
	mkdir -p ~/.config/tmux
	cp -a ./.config/tmux/. ~/.config/tmux/

nvim : ./.config/nvim
	mkdir -p ~/.config/nvim
	cp -a ./.config/nvim/. ~/.config/nvim/

nnn : 
	echo No config.

code : ./.config
	echo Not implemented.

obsidian : ./.config
	echo Not implemented.

guake : ./.config
	echo Not implemented.

kitty : ./.config/kitty
	mkdir -p ~/.config/kitty
	cp -a ./.config/kitty/. ~/.config/kitty/

calibre-server : ./.config
	echo Not implemented.

syncthing : ./.config
	echo Not implemented.

lydm : ./.config
	echo Not implemented.

tui-apps : bash zsh tmux nvim nnn
gui-apps : code obsidian guake kitty
services : calibre-server syncthing

linux : lydm