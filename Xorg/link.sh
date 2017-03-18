#!/bin/bash

mkdir -p ~/.conky

ln -sv `pwd`/xinitrc ~/.xinitrc
ln -sv `pwd`/compton.conf ~/.config/compton.conf
ln -sv `pwd`/conkyrc ~/.conky/conkyrc
ln -sv `pwd`/conky_mpd ~/.conky/conky_mpd
ln -sv `pwd`/i3blocks.conf ~/.i3blocks.conf
ln -sv `pwd`/i3gaps/ ~/.config/i3
ln -sv `pwd`/xprofile ~/.xprofile
ln -sv `pwd`/Xresources ~/.Xresources
ln -sv `pwd`/redshift.conf ~/.config/redshift.conf
ln -sv `pwd`/xmonad ~/.xmonad
ln -sv `pwd`/polybar ~/.config/polybar
ln -sv `pwd`/dunst/ ~/.config/dunst
