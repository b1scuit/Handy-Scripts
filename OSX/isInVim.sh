# Small bit to add to a .##rc file to tell weather inside vim or not
function _vim(){
    if [[ -n $VIM ]]; then
        echo "%{$fg[green]%}[VIM] "
    fi
}

export PS1='$(_vim) '
