#!/bin/bash

mkdir -p ~/.config/htop
ln -sv `pwd`/htoprc ~/.config/htop/htoprc
ln -sv `pwd`/tmux.conf ~/.tmux.conf
