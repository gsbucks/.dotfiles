alias dk='docker-compose -f /home/bucks/src/pico-docker/docker-compose.yml'

alias okgo='git rebase --continue'
alias gst='git status'
alias ggpush='git push origin `git rev-parse --abbrev-ref HEAD`'
alias ggro='git rebase origin/`git rev-parse --abbrev-ref HEAD`'
alias gco='git checkout'

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete gco _git_checkout
else
  echo "Error loading git completions"
fi


alias brighthigh='echo 14000 | sudo tee -a /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness > /dev/null'
alias brightmed='echo 10000 | sudo tee -a /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness > /dev/null'
alias brightlow='echo 7000 | sudo tee -a /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness > /dev/null'

alias vpnup='sudo service openvpn start internal'
alias vpndown='sudo service openvpn stop internal'

alias nomonitor='xrandr --output DP-1 --off'
alias monitor='xrandr --output DP-1 --auto --left-of eDP-1'

alias spotplaypause='dbus-send --print-reply --dest=$SPOTIFY_DEST $SPOTIFY_PATH $SPOTIFY_MEMB.PlayPause'
alias spotnext='dbus-send --print-reply --dest=$SPOTIFY_DEST $SPOTIFY_PATH $SPOTIFY_MEMB.Next'
alias spotprev='dbus-send --print-reply --dest=$SPOTIFY_DEST $SPOTIFY_PATH $SPOTIFY_MEMB.Previous'
