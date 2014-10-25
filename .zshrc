ZSH=$HOME/.oh-my-zsh
ZSH_THEME="blinks"
DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true

plugins=(git vi-mode bundler rails)

__CF_USER_TEXT_ENCODING=0x1F5:0x08000100:0
export __CF_USER_TEXT_ENCODING

EDITOR=vim
export EDITOR

bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

bindkey '^R' history-incremental-search-backward

alias zshconf="vim ~/.zshrc"
alias devtail="less -r -n +F log/development.log"
alias testtail="less -r -n +F log/test.log"
alias migrate="bundle exec rake db:migrate --trace"
alias rollback="bundle exec rake db:rollback"
alias testprep="bundle exec rake db:test:prepare --trace"
alias devsql="mysql --user=root --database navcan_development"
alias testsql="mysql --user=root --database navcan_test"
alias pry="nocorrect pry "
alias drb="rspec --drb"
alias fingerprint="ssh-keygen -l -f "
alias devprep="sed -i '' 's/_test/_development/;2n' config/database.yml && rake db:test:prepare && sed -i '' 's/_development/_test/;2n' config/database.yml"
alias redis="redis-server ~/.redis.conf"

#tmux
alias mux="~/boot_tmux_env"
alias tks="tmux kill-session"
alias tls="tmux list-sessions"
alias tmod="lsof -U | grep '^tmux.*default' | sed -n 's/.*\(\/private.*$\)/\1/p' | xargs chmod 666"

alias fetch="git stash && git fetch && git rebase origin/master && git stash pop"
alias gf="git fetch"
alias ggro='git rebase origin/$(current_branch)'
alias okgo='git rebase --continue'

[[ -r ~/.zshrc-local ]] && . ~/.zshrc-local

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:$PATH:/usr/X11/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
