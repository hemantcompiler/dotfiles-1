#!/bin/sh

if [ -e ~/.Xmodmap ]; then
    echo "It seems that ~/.Xmodmap alredy exists. Do you want to overwrite it?"
    select o in "Yep" "Nope"; do
        if [ $o = "Yep" ]; then
            rm ~/.Xmodmap
            break
        else
            exit 1
        fi
        done
fi

echo "Symlinking..."
ln xmodmap/Xmodmap ~/.Xmodmap
xmodmap ~/.Xmodmap
echo "Done!"
