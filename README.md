# dotfiles

This repo hosts my dotfiles. To install all of them, simply clone and run
`install.sh`

## Structure

Each directory is a *module*. Each module **must** have an `install.sh` and
(optionally) various configuration file. You can install a specific module by
running `module-name/install.sh`

## The philosophy

I'm a vim user, so vim bindings everywhere.

### Vim or NeoVim

There are two version of the config file for vim: lite and full. The lite
version is standalone, it doesn't use plugin or other thing, just that file.
That version works in both vim and neovim.

The full version is the version I use for almost anything! It's thought for
neovim, but (I think) should work also in Vim, but I haven't tested

The instaler will ask you if you want to install the config file for vim or
neovim

The config file for vim will placed in `~/.vimrc`, the config file for neovim
in `~/.config/nvim/init.vim`
