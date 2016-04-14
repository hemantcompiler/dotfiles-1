#!/bin/sh

if [ -e ~/.config/nvim/init.vim ] ; then
    echo "It seems that ~/.config/nvim/init.vim alredy exists. Do you want to overwrite it?"
    select o in "Yep" "Nope"; do
        if [ $o = "Yep" ]; then
            rm ~/.config/nvim/init.vim
            break
        else
            exit 1
        fi
    done
fi


echo "Do you wish to install the lite version (only config) or the full version (config+plugin) of neovim?"
echo "Please, note that if you choose the full version, some external program (like 'git', 'npm', 'make', ...) may be required!"

[ -d ~/.config/nvim ] || mkdir -p ~/.config/nvim

select lf in "Full" "Lite"; do
    case $lf in
        Full)
            echo "Installing vim-plug..."
            curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            echo "...done"
            echo "symlinking + plugin installation..."
            ln nvim/nvim-full.vim ~/.config/nvim/init.vim
            nvim +PlugInstall +qall
            echo "done!"
            break;;
        Lite )
            echo "Symlinking..."
            ln nvim/nvim-lite.vim ~/.config/nvim/init.vim
            echo "done!"
            break;;
    esac
done
