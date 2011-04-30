fpath=(~/.zsh/completion $fpath)
autoload -U zutil
autoload -U compinit
autoload -U complist
compinit
# case-insensitive (uppercase from lowercase) completion
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# zstyle
zstyle ':completion:*' completer _expand _complete _ignored _approximate

zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{green}%d%f%u'

zstyle ':completion:*:sudo:*' command-path assign /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin /opt/local/bin /opt/local/sbin
