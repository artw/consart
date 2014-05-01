setopt autocd         # cd if "command" is a directory
setopt autolist       # automatically list choices on an ambiguous completion
setopt extendedglob   # globbing extended with # ~ ^
setopt notify         # report the status of background jobs immediately
setopt correctall     # correct commands and arguments
setopt nobeep         # disable beep
setopt autopushd      # pushd on cd
setopt pushd_minus    # correct stack order with cd -?
setopt pushd_ignore_dups
setopt long_list_jobs # list jobs in the long format by default

# smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic
