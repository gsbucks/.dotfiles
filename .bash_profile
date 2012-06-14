[[ -s "/Users/bucks/.rvm/scripts/rvm" ]] && source "/Users/bucks/.rvm/scripts/rvm"

alias be="bundle exec"
alias ber="bundle exec rails"
alias devtail="less -r +F log/development.log"
alias testtail="less -r +F log/test.log"
alias gits="git status"
alias migrate="bundle exec rake db:migrate --trace"
alias rollback="bundle exec rake db:rollback"
alias testprep="bundle exec rake db:test:prepare --trace"

alias drb="rspec --drb"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

EDITOR=mvim
export EDITOR

PATH=$PATH:$HOME/.rvm/bin
export PATH

[[ -r ~/.bashrc ]] && . ~/.bashrc
