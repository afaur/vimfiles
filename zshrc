# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true" # upgrade_oh_my_zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler)

source $ZSH/oh-my-zsh.sh
source ~/.rvm/scripts/rvm

# Customize to your needs...
export PATH=/usr/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/bin # generic bin

# Options
setopt interactivecomments
unsetopt correct
unsetopt correct_all

# Directories
alias .pj=" cd ~/VProjects/"
alias .li3=" cd ~/sites/devup/apps/lithium"
alias .dv=" cd ~/sites/devup/"
alias .vt=" cd ~/sites/devup/apps/legacy/vitals/"
alias .hb=" cd ~/sites/devup/apps/vitals/"
alias .mv=" cd ~/sites/devup/apps/myvitals"
alias .my=" cd ~/sites/devup/apps/myvitals"
alias .app=" cd ~/sites/devup/apps"
alias .apps=" cd ~/sites/devup/apps"

# Clear the cache
function .hb.cc() {
	.hb
	# CSS
	if [ $(ls app/webroot/css/compiled/ | wc -l) -gt 0 ]
	then
		echo Ridding CSS
		cd app/webroot/css/compiled/ && rm -f *.css
		.hb
	fi
	# JS
	if [ $(ls app/webroot/js/compiled/ | wc -l) -gt 0 ]
	then
		echo Ridding JS
		cd app/webroot/js/compiled/ && rm -f *.js
		.hb
	fi
	cd -
}

# Composer
alias .composer.get="curl http://getcomposer.org/installer | php"

# Git aliases
alias gs='git status'
alias gco='git checkout'
alias ga='git add -A'
alias gd='git diff'
alias gap='git add . -N && git add --patch'
alias gc="git commit -v"
alias gl='git log --stat'
alias gpr='git pull --rebase'
alias grh='git reset HEAD'
alias grhh='git reset --hard'
alias gfo='git fetch origin'
alias gcp='git cherry-pick'
alias gpfo="git push -f origin"
alias gtl="git tag -n | ruby -e \"puts STDIN.read.lines.sort_by { |t| t.split.first.sub(/^v/, '').sub(/\-rc/, '.1').split('.').map(&:to_i).tap { |v| v << 99 if v.length < 5 } }\""
alias gam="git commit --amend -v --date=\`date +%Y-%m-%dT%H:%M:%S\`"
function gclean() { # Cleans the repo and pulls the latest changes from origin
	git clean -fd
	git fetch origin
	git reset --hard origin/`git rev-parse --abbrev-ref HEAD`
}
function gpo() {
	_hasUpStream && git pull --rebase # If there is an upstream it rebases
	git push origin                   # Pushes to origin
	_setStream                        # Sets upstream
}
function _setStream() { # Sets the upstream to the correctly named branch
	git branch --set-upstream-to=origin/`git rev-parse --abbrev-ref HEAD` `git rev-parse --abbrev-ref HEAD`
}
function _hasUpStream() { # Determines if an upstream is set
	git branch -vv | grep \* | grep origin
}

# Mongo
alias .mongo.start='mongod --config /usr/local/etc/mongod.conf'
alias .mongo.stop='mongo admin --eval "db.shutdownServer()"'

# Postgres
alias .post.start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias .post.stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Mysql
alias .mysql.start='mysql.server start'
alias .mysql.stop='mysql.server stop'

# Redis
alias .redis.start='redis-server /usr/local/etc/redis.conf'

# Common Typos
alias zues="zeus"

# Tail Remote
.tail-remote() {
  group=${1}
  file=${2}
  command dsh -Mcg $group -- "tail -f $file"
}

alias vup="vagrant reload && vagrant ssh -c 'sudo service httpd start'"

# VITALS
.tail-myvitals-prod() { .tail-remote "myvitals-prod" "/var/www/apps/myvitals/current/log/production.log" }
.tail-vitals-prod() { .tail-remote "vitals-prod" "/var/www/apps/honeybadger/shared/log/access.log /var/www/apps/honeybadger/shared/log/error.log" }
