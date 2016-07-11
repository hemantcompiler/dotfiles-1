#!/bin/sh

if [ -e ~/.zshrc ] ; then
    echo "It seems that ~/.zshrc alredy exists. Do you want to overwrite it?"
    select o in "Yep" "Nope"; do
        if [ $o = "Yep" ]; then
            rm ~/.zshrc
            break
        else
            exit 1
        fi
    done
fi

git clone --recursive https://github.com/omar-polo/prezto "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh
