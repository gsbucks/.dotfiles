[[ -s "/Users/bucks/.rvm/scripts/rvm" ]] && source "/Users/bucks/.rvm/scripts/rvm"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="blinks"
DISABLE_AUTO_UPDATE="true"

plugins=(git vi-mode bundler rails3)

EDITOR=mvim
export EDITOR

alias zshconf="vim ~/.zshrc"
alias devtail="less -r +F log/development.log"
alias testtail="less -r +F log/test.log"
alias migrate="bundle exec rake db:migrate --trace"
alias rollback="bundle exec rake db:rollback"
alias testprep="bundle exec rake db:test:prepare --trace"
alias devsql="/usr/local/mysql/bin/mysql --user=root --database navcan_development"
alias testsql="/usr/local/mysql/bin/mysql --user=root --database navcan_test"
alias pry="nocorrect pry "
alias drb="rspec --drb"
alias fingerprint="ssh-keygen -l -f "

PATH=$PATH:$HOME/.rvm/bin
export PATH

source $ZSH/oh-my-zsh.sh

export PATH=/Users/bucks/.rvm/gems/ruby-1.9.3-p194@rails32/bin:/Users/bucks/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/bucks/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/bucks/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/Users/bucks/.rvm/bin
