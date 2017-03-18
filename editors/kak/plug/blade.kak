# https://laravel.com/docs/5.4/blade
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾

# require php.kak, html.kak

# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.](blade\.php) %{
    set buffer filetype blade
}

# Highlighters
# ‾‾‾‾‾‾‾‾‾‾‾‾

add-highlighter -group / regions -default lang blade  \
    comment          {{-- --}}     '' \
    php              {{     }}     '' \
    php              {!!   !!}     '' \
    text             @{{    }}     '' \
    php              @php  @endphp '' \
    php              @(for|foreach|forelse|while|if|elseif|yield|section|extends|component|unless|break|continue|includeIf|include|each|push|stack|inject|slot)\h*\( \) \(

add-highlighter -group /blade/php ref php
add-highlighter -group /blade/comment fill comment
add-highlighter -group /blade/lang ref html

add-highlighter -group /blade/lang regex @(show|endsection|endphp|extends|parent|endcomponent|endslot|verbatim|endverbatim|else|endif|endunless|endfor|endforeach|empty|endforelse|endwhile|endpush|break|continue)\b 0:keyword
add-highlighter -group /blade/php regex @(foreach|forelse|for|while|if|elseif|php|endphp|yield|section|extends|component|unless|break|continue|includeIf|include|each|push|stack|inject|slot) 0:keyword

# Commands
# ‾‾‾‾‾‾‾‾

def -hidden blade-filter-around-selections %{
    # remove trailing white spaces
    try %{ exec -draft -itersel <a-x> s \h+$ <ret> d }
}

def -hidden blade-indent-on-new-line %{
    eval -draft -itersel %{
        # preserve previous line indent
        try %{ exec -draft \; K <a-&> }
        # indent after lines ending with section|component|verbatim|if|elseif|else|php|unless|for|foreach|forelse|emty|while|push
        try %{ exec -draft k <a-x> <a-k> @(section|component|verbatim|if|elseif|else|php|unless|for|foreach|forelse|empty|while|push) <ret> j <a-gt> }
        # indent after lines with @section('...') but not @section("...", "...")
        try %{ exec -draft k <a-x> <a-k> @section\(.*,.*\) <ret> j <lt> }
        # use html-indent-on-new-line to indent html
        html-indent-on-new-line 
    }
}

def -hidden blade-indent-on-char %{
    eval -draft -itersel %{
        # outdent if the user type @end<something>
        try %{ exec -draft <a-h> <a-k> ^\h+@end(section|component|verbatim|if|php|unless|for|foreach|forelse|until|push) <ret> <lt> }
        # use html-indent-on-new-line to indent html
        html-indent-on-char 
    }
}

# Initialization
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾

hook -group blade-highlight global WinSetOption filetype=blade %{
    add-highlighter ref blade
}

hook global WinSetOption filetype=blade %{
    hook window InsertEnd  .* -group blade-hooks  blade-filter-around-selections
    hook window InsertChar \n -group blade-indent blade-indent-on-new-line
    hook window InsertChar .* -group blade-indent blade-indent-on-char
}

hook -group blade-highlight global WinSetOption filetype=(?!blade).* %{
    remove-highlighter blade
}

hook global WinSetOption filetype=(?!blade).* %{
    remove-hooks window blade-indent
    remove-hooks window blade-hooks
}
