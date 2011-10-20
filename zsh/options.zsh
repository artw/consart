setopt autocd autolist extendedglob notify correctall nobeep 

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word

## jobs
setopt long_list_jobs

## pager
export PAGER=less
export LC_CTYPE=en_US.UTF-8

## ls colors ( made with http://geoff.greer.fm/lscolors/ )
export LSCOLORS="ExGxcxdxbxegedabagecad"
export LS_COLORS="di=1;;40:ln=1;;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=34;42:ow=0;43:"
export CLICOLOR=1    # enable color in cli
export GREP_COLOR=32 # enable color in grep
export GREPCOLOR=32
