#! /usr/bin/bash

# delete file
cd ~/My_Arch
rm alacritty/alacritty.yml
rm fish/conf.d/omf.fish
rm i3/config
rm polybar/config
rm ~/My_Arch/.vimrc
# 创建硬链接
cd ~/My_Arch
ln ~/.config/alacritty/alacritty.yml alacritty/alacritty.yml
ln ~/.config/fish/conf.d/omf.fish fish/conf.d/omf.fish 
ln ~/.config/i3/config i3/config
ln ~/.config/polybar/config polybar/config
ln ~/.vimrc ~/My_Arch/.vimrc
