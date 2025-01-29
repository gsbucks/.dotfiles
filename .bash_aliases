alias dk='DEV_ORG=1 docker-compose -f /home/bucks/src/pico-docker/docker-compose.yml -f /home/bucks/src/pico-docker/docker-compose.override.yml'
alias dk2='DEV_ORG=4 docker-compose -f /home/bucks/src/dupe-repos/pico-docker2/docker-compose.yml -f /home/bucks/src/dupe-repos/pico-docker2/docker-compose.override.yml'
alias dk3='DEV_ORG=5 docker-compose -f /home/bucks/src/pico-docker/docker-compose.yml -f /home/bucks/src/pico-docker/docker-compose.override.yml'
# alias dku='docker-compose -f /home/bucks/src/pico-react-contrib/build/docker-compose.yml'
alias mesa='dk up mesassets'
alias dksql='dk exec -u postgres postgres psql org1'
alias dk2sql='dk2 exec -u postgres postgres psql org4'
alias mesgit='dk exec mes sh -c "cd /app/data/1-mergecc && bash"'

alias okgo='git rebase --continue'
alias gst='git status'
alias ggpush='git push origin `git rev-parse --abbrev-ref HEAD`'
alias ggro='git rebase origin/`git rev-parse --abbrev-ref HEAD`'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gitlast='git reflog | grep "checkout: moving from" | head -n 20 | sed -E "s/.*checkout: moving from ([^ ]+) to ([^ ]+).*/\2/"'

if [ -f "/usr/share/bash-completion/completions/git" ]; then
  source /usr/share/bash-completion/completions/git
  __git_complete gco _git_checkout
else
  echo "Error loading git completions"
fi


alias brighthigh='echo 14000 | sudo tee -a /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card1/card1-eDP-1/intel_backlight/brightness > /dev/null'
alias brightmed='echo 10000 | sudo tee -a /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness > /dev/null'
alias brightlow='echo 7000 | sudo tee -a /sys/devices/pci0000\:00/0000\:00\:02.0/drm/card0/card0-eDP-1/intel_backlight/brightness > /dev/null'

alias vpnup='sudo systemctl restart openvpn-client@internal2.service'
alias vpndown='sudo systemctl stop openvpn-client@internal2.service'

alias nomonitor='xrandr --output DP-1 --off'
alias monitor='xrandr --output DP-1 --auto --right-of eDP-1'

alias spotplaypause='dbus-send --print-reply --dest=$SPOTIFY_DEST $SPOTIFY_PATH $SPOTIFY_MEMB.PlayPause'
alias spotnext='dbus-send --print-reply --dest=$SPOTIFY_DEST $SPOTIFY_PATH $SPOTIFY_MEMB.Next'
alias spotprev='dbus-send --print-reply --dest=$SPOTIFY_DEST $SPOTIFY_PATH $SPOTIFY_MEMB.Previous'

alias servy='ssh bucks@servy'
alias irrigation='ssh pi@irrigation'
alias irrigation2='ssh ubuntu@irrigation2'
alias servypipe='ssh -L 9999:localhost:32400 bucks@servy'
#alias dkredbt='dk up mes-migrations mes-migrations-test; until dk run --rm dbt dbt run --full-refresh; do sleep 1; done && until dk run --rm dbt-test dbt run --full-refresh; do sleep 1; done && dk restart data-api data-api-test'
alias dkdevdbt='dk up mes-migrations && dk run --rm dbt dbt run --full-refresh && dk restart data-api'
alias dk2devdbt='dk2 up mes-migrations && dk2 run --rm dbt dbt run --full-refresh && dk2 restart data-api'
alias dktestdbt='dk up mes-migrations-test && dk run --rm dbt-test dbt run --full-refresh && dk restart data-api-test'
alias dk2testdbt='dk2 up mes-migrations-test && dk2 run --rm dbt-test dbt run --full-refresh && dk2 restart data-api-test'

alias compilemigrations="dk run --rm -e GOOS=linux -e GOARCH=amd64 mes /bin/sh -c \"cd /app/cmd/mes && go build -buildvcs=false -ldflags '-s -w' -o migrate picomes.com/cmd/migrations\""
alias compilemigrations2="dk2 run --rm -e GOOS=linux -e GOARCH=amd64 mes /bin/sh -c \"cd /app/cmd/mes && go build -buildvcs=false -ldflags '-s -w' -o migrate picomes.com/cmd/migrations\""

alias destroytest='
cd ~/src/pico-mes && \
dk stop mes_test mes-manage-test data-api-test && \
sudo rm -rf data/2* && \
dk exec -u postgres postgres psql -c "drop database org2" && \
dk exec -u postgres postgres psql -c "create database org2" && \
dk up -d mes_test
'

alias destroytest2='
cd ~/src/dupe-repos/pico-mes && \
dk2 stop mes_test data-api-test && \
sudo rm -rf data/2* && \
dk2 exec -u postgres postgres psql -c "drop database org2" && \
dk2 exec -u postgres postgres psql -c "create database org2" && \
dk2 up -d mes_test
'


alias penremotedeb='ssh -L 9223:localhost:9222 pi@192.168.86.202'
alias n8npipe='ssh -L 5678:172.17.0.1:5678 pico@morryde.picomes.io'
alias prompipe='gcloud compute ssh --zone "us-central1-a" services -- -NL 9090:localhost:9090'

alias dropvpnonly='gcloud compute instances remove-tags cloud-api --zone us-central1-a --tags vpn-ssh-only'
alias addvpnonly='gcloud compute instances add-tags cloud-api --zone us-central1-a --tags vpn-ssh-only'
