autoload -U zutil
autoload -U compinit
autoload -U complist
compinit

# messages and warnings
#zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# case-insensitive completion
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=37=31"

# menu and style
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{blue}%d%f%u'

# complete sudo
zstyle ':completion:*:sudo:*' command-path assign /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin /opt/local/bin /opt/local/sbin
