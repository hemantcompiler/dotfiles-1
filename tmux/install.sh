#!/bin/sh

if [ -e ~/.tmux.conf ] ; then
    echo "It seems that ~/.tmux.conf alredy exists. Do you want to overwrite it?"
    select o in "Yep" "Nope"; do
        if [ $o = "Yep" ]; then
            rm ~/.tmux.conf
            break
        else
            exit 1
        fi
    done
fi

echo "Do you whish to install tmux config?"
select yn in "Yes" "Nope"; do
    if [ $yn = "Yes" ]; then
        echo "Symlinking..."
        ln tmux/tmux.conf ~/.tmux.conf
        break
    fi
done
