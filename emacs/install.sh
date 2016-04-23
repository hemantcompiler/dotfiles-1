#!/bin/sh

file=~/.emacs

if [ -e $file ] ; then
    echo "It seems that $file alredy exists. Do you want to overwrite it?"
    select o in "Yep" "Nope"; do
        if [ $o = "Yep" ]; then
            rm $file
            break
        else
            exit 1
        fi
    done
fi

echo "Installing emacs config"
echo "Symlinking..."

ln emacs/emacs.el $file

echo "Done!"
