#!/bin/bash

# Set random wallpaper
theme_dir="$HOME/.config/awesome/themes/default"

rm $theme_dir/theme.lua

file=$(ls -1 $HOME/wallpapers/ | sort --random-sort | head -1)
feh --bg-scale $HOME/wallpapers/$file

# Generate colorscheme
wal -i $HOME/wallpapers/$file
cp $HOME/.cache/wal/colors.json $theme_dir/colors.json
cp $theme_dir/theme.lua.base $theme_dir/theme.lua 

get_color() {
	color=$(jq .colors.color$1 $theme_dir/colors.json)
	sed -i "s/c$1/$color/g" $theme_dir/theme.lua
}

get_color 3

rm $theme_dir/colors.json
