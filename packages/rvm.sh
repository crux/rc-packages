[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function clear-rails-and-ruby-package() {
    unalias -a r
    unalias -a testrb
    unalias -a ri
    unalias -a rdoc
    unalias -a rake
    unalias -a irb
    unalias -a gem
    unalias -a er
}
clear-rails-and-ruby-package

alias r=ruby
