#!/bin/bash

function gsay() {
    #mplayer http://translate.google.com/translate_tts?q=" #I+love+techcrunch
    echo "mplayer http://translate.google.com/translate_tts?q=$*"
}

alias http_status_codes="cheat http_status_codes"

#   some bread and butter aliases 
alias a='alias'
alias A='cd ~/rc/packages; vi aliases.sh; source aliases.sh; cd -'
alias ..="cd .."
alias cd..="cd .."
alias timecard="vi ~/.timecard"
alias h='history'
alias hgrep='history | ack'
alias htail='history | tail'
function whatsyourcommand() {
    history | awk '{print $2}' | sort | uniq -c | sort -n | tail -23
}
alias pgrep='ps -ef -ww | grep'
#alias psgrep='ps -auxww | grep'
alias systail='sudo tail -f /var/log/messages'
alias tf='tail -f'
alias j='jobs'
alias @='sudo '
alias @@='sudo su \- root'
alias more=less
alias clean="cat < /dev/null > "
alias '+x'='chmod +x '
alias timestamp='echo $(date +'%Y%m%d_%R:%S') > ~/.ts && cat ~/.ts'

# end of file
