#!/bin/bash

ln -sv `pwd`/inputrc ~/.inputrc

ln -sv `pwd`/kak ~/.config/kak

ln -sv `pwd`/vimrc ~/.vimrc

ln -sv `pwd`/nvim ~/.config/nvim

printf "Installing vim-plug...\n"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "Installing plugins...\n"

nvim +PlugUpdate
