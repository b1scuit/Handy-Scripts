# Add this to your ~/.*rc file

export PS1="\h:\$(git branch 2> /dev/null | grep \* | cut -d ' ' -f2) \W : "
