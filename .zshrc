[[ -s "/Users/bucks/.rvm/scripts/rvm" ]] && source "/Users/bucks/.rvm/scripts/rvm"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="blinks"
DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true

plugins=(git vi-mode bundler rails3)

__CF_USER_TEXT_ENCODING=0x1F5:0x08000100:0
export __CF_USER_TEXT_ENCODING

EDITOR=vim
export EDITOR

alias zshconf="vim ~/.zshrc"
alias devtail="less -r -n +F log/development.log"
alias testtail="less -r -n +F log/test.log"
alias migrate="bundle exec rake db:migrate --trace"
alias rollback="bundle exec rake db:rollback"
alias testprep="bundle exec rake db:test:prepare --trace"
alias devsql="/usr/local/mysql/bin/mysql --user=root --database navcan_development"
alias testsql="/usr/local/mysql/bin/mysql --user=root --database navcan_test"
alias pry="nocorrect pry "
alias drb="rspec --drb"
alias fingerprint="ssh-keygen -l -f "
alias devprep="sed -i '' 's/_test/_development/;2n' config/database.yml && rake db:test:prepare && sed -i '' 's/_development/_test/;2n' config/database.yml"

#tmux
alias mux="~/boot_tmux_env"
alias tks="tmux kill-session"
alias tls="tmux list-sessions"

alias fetch="git stash && git fetch && git rebase origin/master && git stash pop"
alias gf="git fetch"
alias ggro='git rebase origin/$(current_branch)'

PATH=$PATH:$HOME/.rvm/bin
export PATH

source $ZSH/oh-my-zsh.sh

export PATH=/Users/bucks/.rvm/gems/ruby-1.9.3-p194@rails32/bin:/Users/bucks/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/bucks/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/bucks/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/Users/bucks/.rvm/bin
