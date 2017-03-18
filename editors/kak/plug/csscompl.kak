# Auto-completion
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾


decl -hidden str css_complete_tmp_dir
decl -hidden completions css_completions

def css-complete -docstring "Complete the current css selection" %{
    %sh{
        dir=$(mktemp -d -t kak-css.XXXXXXXX)
        printf %s\\n "set buffer css_complete_tmp_dir ${dir}"
        printf %s\\n "eval -no-hooks write ${dir}/buf"
    }
    %sh{
        dir=${kak_option_css_complete_tmp_dir}

        (
            # TODO get completion candidates from ${dir}/buf

            rm -r $dir
            echo ${kak_cursor_column} >> /tmp/kak-css-cursor-column
            header="${kak_cursor_line}.$((${kak_cursor_column} -0))@${kak_timestamp}"
            compl="background-color|set the bg color|menu text:background-image|set the bg image|menu text bg image"
            printf %s\\n "eval -client '${kak_cilent}' %{
                set buffer=${kak_bufname} css_completions '${header}:${compl}'
            }" | kak -p ${kak_session}
        ) > /dev/null 2>&1 < /dev/null &
    }
}

def css-enable-autocomplete -docstring "Add css completion candidates to the completer" %{
    set window completers "option=css_completions:%opt{completers}"
    hook window -group css-autocomplete InsertIdle .* %{ try %{
        exec -draft <a-h><a-k>[\w\.].\z<ret>
        css-complete
    } }

    alias window complete css-complete
}
