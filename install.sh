#!/bin/sh

for d in $(find -path './[^.]*' -prune -type d); do
    if [ "z$d" = 'z.' -o "z$d" = "z./.git" ]; then
        continue
    else
        printf "\n\n======================================\n"
        echo "Install the config file for $d?"
        select o in "Yes" "No"; do
            if [ $o = "Yes" ]; then
                . $d/install.sh
            fi
            break
        done
    fi
done
