#!/bin/sh

echo "Do you wish to install the config file for vim or neovim?"
echo "Please, not that the lite version works everywhere, the full version should work also in vim, but I haven't tested!"

select vn in "Vim" "Neovim"; do
    case $vn in
        Vim)
            edit="vim"
            folder="$HOME/.vim"
            file=~/.vimrc
            break;;
        Neovim)
            edit="nvim"
            folder="$HOME/.config/nvim"
            file=$folder/init.vim
            break;;
    esac
done

[ ! -e $folder ] && mkdir $folder

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

echo "Do you wish to install the lite version (only config) or the full version
(config+plugin) of $edit config?"
echo "Please, note that if you choose the full version, some external program (like 'git', 'npm', 'make', ...) may be required!"

select lf in "Full" "Lite"; do
    case $lf in
        Full)
            echo "Installing vim-plug..."
            curl -fLo $folder/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            echo "...done"
            echo "symlinking + plugin installation..."
            ln nvim/nvim-full.vim $file
            $edit +PlugInstall +qall
            echo "done!"
            break;;
        Lite)
            echo "Symlinking..."
            ln nvim/nvim-lite.vim $file
            echo "done!"
            break;;
    esac
done
