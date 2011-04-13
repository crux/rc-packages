[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

function clear-rails-and-ruby-package() {
    unalias r
    unalias testrb
    unalias ri
    unalias rdoc
    unalias rake
    unalias irb
    unalias gem
    unalias er
}
clear-rails-and-ruby-package

alias r=ruby
