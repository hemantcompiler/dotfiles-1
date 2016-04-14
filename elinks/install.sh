#!/bin/sh

if [ -e ~/.elinks/elinks.conf ] ; then
    echo "It seems that ~/.elinks/elinks.conf alredy exists. Do you want to overwrite it?"
    select o in "Yep" "Nope"; do
        if [ $o = "Yep" ]; then
            rm ~/.elinks/elinks.conf
            break
        else
            exit 1
        fi
    done
fi

[ -d ~/.elinks ] || mkdir -p ~/.elinks

ln elinks/elinks.conf ~/.elinks/elinks.conf
