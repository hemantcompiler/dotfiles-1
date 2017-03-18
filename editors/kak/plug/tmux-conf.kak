# tmux url

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*tmux.conf %{
    set buffer filetype tmux
}

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter -group / regions -default text tmux \
    comment '(?<!\$)#' $ '' \
    string  '\'' '\'' '' \
    string '"' '"' ''

add-highlighter -group /tmux/comment fill comment
add-highlighter -group /tmux/string  fill string

add-highlighter -group /tmux/text regex \b(set-option|set-window|set-window-option|setw|set|unbind|bind|run|source-file|display)\b 0:keyword
add-highlighter -group /tmux/text regex \b(black|red|green|yellow|blue|magenta|cyan|white)\b 0:attribute
add-highlighter -group /tmux/text regex colour\d{1,3} 0:attribute

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook -group tmux-highlight global WinSetOption filetype=tmux %{
    add-highlighter ref tmux
}

hook -group tmux-highlight global WinSetOption filetype=(?!tmux).* %{
    remove-highlighter tmux
}
