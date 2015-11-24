#
# Universal Tobi.com .bash_profile script.
#

#if [ -f ~/.bashrc ]; then
#  . ~/.bashrc
#fi

# GLOBALIZE BASHRC VARIABLES
export PATH=$PATH
export JETTY_HOME=$JETTY_HOME
export MEMCACHE_HOME=$MEMCACHE_HOME
export PG_HOME=$PG_HOME
export RVM_HOME=$RVM_HOME

# SYSTEM
# export NUM_CORES=2

# TOBI APP
export CODE="$HOME/code"
export TRUNK="$HOME/code/trunk"
export CURRENT="$HOME/code/current"
export MASTER="$HOME/code/master"
export DOCS=$HOME/code/docs
export SYSTEM=$HOME/code/system
export STACK=$HOME/stack

# GIT
export GIT_TOBI="git@github.com:gittobi"
source ~/.git-completion.bash

# HISTORY
HISTTIMEFORMAT='%F %T '
export HISTTIMEFORMAT
export HISTORYFILESIZE=2000
export HISTCONTROL=erasedups
shopt -s histappend

# Rake
#alias rake='rake _0.8.7_'

# JETTY
alias start_jetty="$JETTY_HOME/bin/jetty.sh start"
alias stop_jetty="$JETTY_HOME/bin/jetty.sh stop"

# MEMCACHE
alias start_memcache="$MEMCACHE_HOME/bin/memcached -d -p 11211 -m 128 -P $MEMCACHE_HOME/memcached.pid"

# NGINX
alias start_nginx="sudo /usr/local/nginx/sbin/nginx"

# POSTGRESQL
export PGDATABASE=$PGDATABASE
export PGSQL=$PG_HOME/bin
export PGDATA=$PG_HOME/data
export MANPATH=$PG_HOME/share/man:$MANPATH
export PSQL_EDITOR=vim
alias start_pg="pg_ctl start"
alias stop_pg="pg_ctl stop"

# PROMPT
export PS1='\[\033[01;32m\]\[\033[01;34m\] \w\[\033[31m\] $(__git_ps1 "(%s)") \[\033[01;34m\]$\[\033[00m\] '
export PS1="\$(~/.rvm/bin/rvm-prompt) $PS1"

# RVM
[[ -s "$RVM_HOME/scripts/rvm" ]] && source "$RVM_HOME/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# RUBY REE Performance Settings
# https://gist.github.com/865706
# http://www.rubyenterpriseedition.com/documentation.html
export RUBY_HEAP_MIN_SLOTS=5000000
export RUBY_HEAP_SLOTS_INCREMENT=500000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=200000000
export RUBY_HEAP_FREE_MIN=500000

# SOLR
export SOLR_DB_SERVER=localhost
export SOLR_DB_NAME=master
export SOLR_DB_USER=dev
export SOLR_DB_PASS=
export SOLR_HOME=~/stack/solr
export JAVA_OPTIONS="-Dsolr.solr.home=$SOLR_HOME"

#
# ALIASES
#
alias ls='ls -GF'
alias vim='mvim'
alias code="cd $CODE"
alias trunk="cd $TRUNK"
alias master="cd $MASTER"
alias current="cd $CURRENT"
alias docs="cd $DOCS"
alias system="cd $SYSTEM"
alias stack="cd $STACK"
alias findsrc="find . -name '*.rb' -o -name '*.erb' -o -name '*.sql' -o -name '*.rhtml' -o -name '*.journal' -o -name '*.rjs' -o -name '*.yml' -o -name '*.rake' -o -name '*.rxml' -o -name '*.css' -o -name '*.xml' -o -name '*.js' -type f | xargs grep -n"
alias release_sql='psql -U dev -d tobi_dev -1 -f release.sql -E  -L out.log'
alias start_rel="script/server -e development_rel -p 3001"

# SERVER ALIASES
alias asset1="ssh build@asset1.tobi.com"
alias store1="ssh build@store1.tobi.com"
alias store2="ssh build@store2.tobi.com"
alias store3="ssh build@store3.tobi.com"
alias store4="ssh build@store4.tobi.com"
alias admin1="ssh build@admin1.tobi.com"
alias admin2="ssh build@admin2.tobi.com"
alias db1="ssh build@db1.tobi.com"
alias db2="ssh build@db2.tobi.com"
alias db3="ssh build@db3.tobi.com"
alias dev1="ssh build@dev1.tobi.com"
alias dev2="ssh build@dev2.tobi.com"
alias dev3="ssh build@dev3.tobi.com"
alias builder="ssh build@builder.tobi.com"

# Upgrade your environment
alias upgrade_bash_env="pushd . && cd $DOCS && git pull && system/install/files/osx/env/install.sh && popd"

unset SSH_AUTH_SOCK

#
# SOURCE YOUR PERSONAL ENVIRONMENT SETTINGS FROM '~/.$USER_profile'
# NOTE: Items in your personal environment file will override the environment above so be careful.
#
#USER_PROFILE_FILE=$HOME'/.'$USER'_profile'
#if [ -e $USER_PROFILE_FILE ]; then
#  source $USER_PROFILE_FILE
#else
#  touch $USER_PROFILE_FILE
#  echo "No personal profile file found. I went ahead and created one for you in $USER_PROFILE_FILE"
#fi
