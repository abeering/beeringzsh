#
# Universal Tobi.com .bashrc script.
#

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

PGDATABASE=master

# Start with a fresh PATH
PATH=~/bin:~/code/system:/sbin:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin

# ANT
ANT_HOME=~/stack/ant
PATH=$ANT_HOME/bin:$PATH

# GIT
GIT_HOME=/usr/local/git
PATH=$GIT_HOME/bin:$PATH

# JETTY
JETTY_HOME=~/stack/jetty
PATH=$JETTY_HOME/bin:$PATH

# MEMCACHE
MEMCACHE_HOME=~/stack/memcache
PATH=$MEMCACHE_HOME/bin:$PATH

# POSTGRES
PG_HOME=~/stack/pgsql
PATH=$PG_HOME/bin:$PATH

# RVM
RVM_HOME=$HOME/.rvm
rvm_trust_rvmrcs_flag=1

source ~/.bash_profile
