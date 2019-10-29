#! /usr/bin/bash

# vim
rm -rf ~/.vim
rm ~/.vimrc
cp ~/My_Arch/.vimrc ~/.vimrc
cp ~/My_Arch/.vim ~/.vim

#i3
rm ~/.config/i3/config
cp ~/My_Arch/i3/config ~/.config/i3/config

# polybar
rm  -rf ~/.config/polybar
cp -r ~/My_Arch/polybar ~/.config/polybar

# fish
rm-r ~/.config/fish
cp -r ~/My_Arch/fish

# wallpaper
cp ~/My_Arch/wallpaper ~/wallpaper

# xmodmap
cp ~/My_Arch/.xmodmap ~/.xmodmap

# xprofile
cp ~/My_Arch/.xprofile ~/.xprofile
