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

if hash curl 2> /dev/null; then
    # download & execute oh-my-zsh installing program
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # and then download my favourite theme
    curl -k https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme -o ~/.oh-my-zsh/themes/honukai.zsh-theme

elif hash wget 2> /dev/null; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    wget https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm/master/honukai.zsh-theme -O ~/.oh-my-zsh/themes/honukai.zsh-theme

else
    echo "It seems that you don't have curl or wget. I can't install oh-my-zh."
    echo "Aborting..."
    exit 1
fi

# remove the default .zshrc
rm ~/.zshrc
# link my customized zshrc
ln zsh/zshrc ~/.zshrc
