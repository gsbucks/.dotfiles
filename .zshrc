ZSH=$HOME/.oh-my-zsh
ZSH_THEME="blinks"
DISABLE_AUTO_UPDATE=true
DISABLE_AUTO_TITLE=true

plugins=(git vi-mode)

__CF_USER_TEXT_ENCODING=0x1F5:0x08000100:0
export __CF_USER_TEXT_ENCODING

EDITOR=vim
export EDITOR

bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

bindkey '^R' history-incremental-search-backward

alias fingerprint="ssh-keygen -l -f "

#tmux
alias mux="~/boot_tmux_env"
alias tks="tmux kill-session"
alias tls="tmux list-sessions"
alias tmod="lsof -U | grep '^tmux.*default' | sed -n 's/.*\(\/private.*$\)/\1/p' | xargs chmod 666"

alias fetch="git stash && git fetch && git rebase origin/master && git stash pop"
alias gf="git fetch"
alias ggro='git rebase origin/$(current_branch)'
alias okgo='git rebase --continue'

alias lsnc='ls --color=never'

alias nuc='ssh pico@192.168.1.138'

alias dk='docker-compose -f ~/src/pico-docker/docker-compose.yml'

[[ -r ~/.zshrc-local ]] && . ~/.zshrc-local

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/local/go/bin:$PATH:/usr/X11/bin:/Users/bucks/go/bin"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bucks/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bucks/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bucks/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bucks/google-cloud-sdk/completion.zsh.inc'; fi
