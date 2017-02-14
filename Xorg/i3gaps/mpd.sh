#!/bin/sh

# if [[ -n $BLOCK_INSTANCE ]]; then
#     password=("-h" "$BLOCK_INSTANCE@localhost")
# fi

filter() {
    tr '\n' ' ' | grep -Po '.*(?= \[playing\])|paused' | tr -d '\n'
}

case $BLOCK_BUTTON in
    3) mpc toggle | filter ;; # right click
    4) mpc prev   | filter ;; # scroll up
    5) mpc next   | filter ;; # scroll down
    *) mpc status | filter ;;
esac
