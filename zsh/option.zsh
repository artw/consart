setopt autocd         # cd if "command" is a directory
setopt autolist       # automatically list choices on an ambiguous completion
setopt extendedglob   # globbing extended with # ~ ^
setopt notify         # report the status of background jobs immediately
setopt nocorrectall   # do not correct commands and arguments
setopt nobeep         # disable beep
setopt autopushd      # pushd on cd
setopt pushd_minus    # correct stack order with cd -?
setopt pushd_ignore_dups
setopt long_list_jobs # list jobs in the long format by default
setopt no_hup         # do not send HUP to background jobs on exit

# smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# edit command line
autoload -U edit-command-line
zle -N edit-command-line

# vcs info
autoload -U vcs_info
zstyle ':vcs_info:git:*' formats '{%b}'
zstyle ':vcs_info:*' enable git
