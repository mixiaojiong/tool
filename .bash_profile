export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
alias ll="ls -l"
alias la="ls -a"
alias vi="vim"
alias df="df -h"
alias www="cd /usr/local/var/www"
alias log="cd /usr/local/var/log"
alias letv="cd ~/Code/letv/"
alias mysql="mysql -u root"
alias SCODE="sh ~/Tool/searchCode.sh"
#nginx
alias nginx.configure='./configure --prefix=../dst --add-module=../module/sso --with-debug --add-module=../module/echo'
alias nginx.kill='ps aux | grep nginx | grep -v svn | awk '\''{print $2}'\'' | xargs kill -9'
alias nginx.module='./objs/nginx &'
alias nginx.start="sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist"
alias nginx.stop="sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist"
alias nginx.restart="nginx.stop && nginx.start"
alias nginx.watch='ps aux | grep nginx | grep -v '\''svn'\'
#mysql
alias mysql.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias mysql.restart="mysql.stop && mysql.start"
#redis
alias redis.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist"
alias redis.restart="redis.stop && redis.start"
#memcached
alias memcached.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist"
alias memcached.restart="memcached.stop && memcached.start"
#mongodb
alias mongodb.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
alias mongodb.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist"
#php
alias php-fpm.start="launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
alias php-fpm.stop="launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php70.plist"
#golang
export GOPATH=/Users/xiaojiong/Code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
