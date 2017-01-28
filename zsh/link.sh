#!/bin/bash

ln -sv `pwd`/alias ~/.alias
ln -sv `pwd`/zplugrc ~/.zplugrc

# workaround for arch linux
ln -sv `pwd`/zshenv ~/.zprofile
ln -sv `pwd`/zshenv ~/.zshenv

ln -sv `pwd`/zshrc ~/.zshrc
ln -sv `pwd`/zlogin ~/.zlogin

