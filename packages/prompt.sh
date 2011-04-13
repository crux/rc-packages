#!/bin/bash

black="\[\033[0;30m\]"
red="\[\033[0;31m\]"
green="\[\033[0;32m\]"
darkyellow="\[\033[0;33m\]"
deepblue="\[\033[0;34m\]"
magenta="\[\033[0;35m\]"
blue="\[\033[0;36m\]"
lime="\[\033[1;37m\]"
lime="\[\033[1;38m\]"
lime="\[\033[1;39m\]"
white="\[\033[0;40m\]"
red_inv="\[\033[0;41m\]"

if [ "$UID" = "0" ];
then
\# I am root
    COLOR2="\[\033[1;31m\]"
fi

#PS1="$lime\u $green\h$lime \w: "
#PS2="$lime\u ${grey}\h${lime} ${w}:: "
#PS1="\e[39m\u\e[m \e[32m\h\e[m \w: "
PS1="\[\033[39m\]\u \[\033[32m\]\h \[\033[39m\]\w: "
PS2="\e[31m\u\e[m \e[32m\h\e[m \w:: "

function cd() {

    builtin cd "${1:-${HOME}}"
#echo --$1--
    w=$(~/rc/c2prompt.pl)
#echo --$w--
    #PS1="\e[39m\u\e[m \e[32m\h\e[0m\] ${w}: "
    #PS1="\[\e[1;31;44m\] \u \[\e[0m\] @ \[\e[32m\h\[\e[0m\] ${w}: "
    PS1="\[\033[39m\]\u \[\033[32m\]\h \[\033[39m\]${w}: "
    #PS1="\[\e[39m\]\u\[\e[0m\]@\[\e[32m\h\[\e[0m\] ${w}: "
    PS2=" >> "
}

