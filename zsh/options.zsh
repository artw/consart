## disable stty stop (needed for vim surround plugin)
stty stop ''
setopt autocd autolist extendedglob notify correctall nobeep 

## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## jobs
setopt long_list_jobs

