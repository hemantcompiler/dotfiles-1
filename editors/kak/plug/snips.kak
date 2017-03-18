decl -docstring 'The folder that will store the snippets, by default ~/.config/kak/snips/' \
    str snips_folder "~/.config/kak/snips/"

def -docstring 'Creates the folder for the snippets' \
    snips-init %{ nop %sh{ mkdir -p ${kak_opt_snips_folder} } }

    #-params 1 -shell-candidates %{ eval 'find ${kak_opt_snips_folder} -type f' } \
def -docstring 'Create or edit snippet' \
    -params 1 -shell-candidates %{ cd $kak_opt_snips_folder && find .-type f } \
    snips-add-edit \
    %{
        %sh{ echo edit ${kak_opt_snips_folder}$1 }
    }

def -docstring 'Expand the current selection with a snippet' \
    snips-expand \
    %{
        exec -draft %sh{
            if [ -e ${kak_opt_snips_folder}${kak_selection} ]; then
                echo "|cat<space>${kak_opt_snips_folder}${kak_selection}<ret>"
            else
                echo ":nop<ret>"
            fi
        }
    }

def -docstring 'Replace the currents selection(s) with a given snippet' \
    -params 1 -shell-completion "cd ${kak_opt_snips_folder} && find . -type f" \
    snips-replace-with \
    %{
        exec -draft %sh{
            if [ -e ${kak_opt_snips_folder}$1 ]; then
                echo "|echo<space>${kak_opt_snips_folder}$1<ret>"
            else
                echo "|echo<space>not<space>exist<space>${kak_opt_snips_folder}$1<ret>"
            fi
        }
    }


def -docstring 'choose snips with fzf' \
    snips-fzf-choose %{ %sh{
        if [ -z "$TMUX" ]; then
            echo echo only works inside tmux
        else
            SNIPS=`cd ${kak_opt_snips_folder} && fzf-tmux -d 15`
            echo snips-replace-with $SNIPS
        fi
    }
}

map global insert <c-u> '<esc><a-i>W:snips-expand<ret>'
