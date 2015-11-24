# andy .zshrc - Starting Over - 2012 Style

# aliases
alias ls="ls -G"
alias mou="open -a Mou"

# load colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
	colors
fi
PR_NO_COLOR="%{$terminfo[sgr0]%}"
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
	eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
	eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        (( count = $count + 1 ))
done

# between quotation marks is the tool output for LS_COLORS
export LSCOLORS="fxexcxdxCxegedabagacad";
export LS_COLORS="di=35;40:ln=34;40:so=32;40:pi=33;40:ex=1;;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:";
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# prompt stuff

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '+' && return
    echo 'o'
}

#PROMPT=$PR_GREEN%n$PR_NO_COLOR\ on\ %m\ %~\ $(prompt_char)%#\ 
#RPROMPT=[\ %D\ %t\ ]

setopt promptsubst
# Load the prompt theme system
autoload -U promptinit
promptinit
# Use the wunjo prompt theme
prompt wunjo

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andy/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# home and end keys on osx
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/Downloads/adt-bundle-mac-x86_64-20131030/sdk/tools
PATH=$PATH:$HOME/Downloads/adt-bundle-mac-x86_64-20131030/sdk/platform-tools
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Tobi stuff
source ~/.tobi_stuff

