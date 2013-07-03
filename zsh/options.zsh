## for use C-S and C-Q in vim maps
if which stty > /dev/null;then
## tweak tty for vim
  stty -ixon
  stty stop ''
fi
setopt autocd         # cd if "command" is a directory
setopt autolist       # automatically list choices on an ambiguous completion
setopt extendedglob   # globbing extended with # ~ ^
setopt notify         # report the status of background jobs immediately
setopt correct        # correct commands only
setopt nobeep         # disable beep
setopt autopushd      # pushd on cd
setopt long_list_jobs # list jobs in the long format by default
## smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## jobs

