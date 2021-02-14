#!/bin/bash
###
### DOTFILE MANAGER
### Kawaegle Only
### 

CONFIG="$HOME/.config"
DOTFILE="$HOME/GIT/Dotfile/"
DOTFILE_DIR="$HOME/GIT/Dotfile/Dotfile"

Save_Restore()
{
	printf "Did you want to save or restore your curent dotfile ?\n\n 1: Save\n 2: Restore\n" 
	read SAVE_RESTORE
	[ $SAVE_RESTORE == 1 ] && Save ; exit || [ $SAVE_RESTORE == 2 ] && Restore ; exit || echo "Hack your Ass N00B!!!"
}

Save()
{
	if [[ -d $DOTFILE && -d $DOTFILE_DIR ]] then ;
		echo "saving i3" && cp -r $CONFIG/i3 $DOTFILE_DIR/ ;
		echo "saving libreoffice" && cp -r $CONFIG/libreoffice $DOTFILE_DIR/ ;
   		echo "saving code" && cp -r $CONFIG/Code\ -\ OSS/User/settings.json $DOTFILE_DIR/vscode_settings.json ;
   		echo "saving compositor" && cp -r $CONFIG/compton.conf $DOTFILE_DIR/ ;
   		echo "saving htop" && cp -r $CONFIG/htop/ $DOTFILE_DIR/ ; 
   		echo "saving ranger" ; cp -r $CONFIG/ranger/ $DOTFILE_DIR/ ; 
   		echo "saving mpv" && cp -r $CONFIG/mpv/ $DOTFILE_DIR/ ; 
   		echo "saving Xresources" && cp -r $HOME/.Xresources $DOTFILE_DIR/Xresources ; 
   		echo "saving bin" && cp -r $HOME/.local/bin/ $DOTFILE_DIR/ ; 
   		echo "saving vim" && rm -rf $HOME/.vim/plugged && cp -r $HOME/.vim/ $DOTFILE_DIR/vim ; 
   		echo "saving zsh" && cp -r $HOME/.zsh/ $DOTFILE_DIR/zsh ;
   else [[ ! -d $DOTFILE_DIR ]] 
   		mkdir -p $DOTFILE_DIR && Save || [ ! -d $DOTFILE ] && git clone https://github.com/alecromski/Dotfile $DOTFILE && Save
	fi
}

Restore()
{   
	if [[ -d $DOTFILE  && -d DOTFILE_DIR ]] then;
		echo "restore i3" && $DOTFILE_DIR/i3 $CONFIG/ ; 
		echo "restore ranger" && cp -r $DOTFILE_DIR/ranger $CONFIG/ ; 
		echo "restore htop" && cp -r $DOTFILE_DIR/htop $CONFIG/ ; 
		echo "restore rtorrent" && cp -r $DOTFILE_DIR/rtorrent $CONFIG/ ; 
		echo "restore code" && cp -r $DOTFILE_DIR/vscode_setings.json $CONFIG/Code\ -\ OSS/User/settings.json ; 
		echo "restore compositor" && cp -r $DOTFILE_DIR/compton.conf $CONFIG/ ; 
		echo "restore mpv" && cp -r $DOTFILE_DIR/mpv $CONFIG ; 
		echo "restore Xresources" && cp -r $DOTFILE_DIR/Xresources $HOME/.Xresources ; 
		echo "restore vim" && cp -r $DOTFILE_DIR/vim $HOME/.vim && ln -sf $HOME/.vim/vimrc $HOME/.vimrc ; 
		echo "restore zsh" && cp -r $DOTFILE_DIR/zsh $HOME/.zsh && ln -sf $HOME/.zsh/zshrc $HOME/.zshrc ; 
		echo "restore bin" && cp -r $DOTFILE_DIR/bin $HOME/.local/bin/ ;
	else [[ ! -d $DOTFILE ]] 
		git clone https://github.com/alecromski/Dotfile $DOTFILE && restore
	fi
}

Save_Restore