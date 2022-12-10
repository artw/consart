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
zstyle ':completion:*' regular off # do not expand regular aliases 
zstyle ':completion:*' completer _expand_alias _expand _complete _ignored _approximate 
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{blue}%d%f%u'

# complete sudo
#zstyle ':completion:*:sudo:*' command-path assign $fpath 

# ignore completion functions for not existent commands
zstyle ':completion:*:functions' ignored-patterns '_*'

# load custom compdefs
for f in ~/.zsh/functions/Completion/**; do
  # compdef _mycmd mycmd
  compdef $f:t ${${f:t}:1:$}
done

compdef _ssh '@'

iscmd kubectl && source <(kubectl completion zsh)
if iscmd k9s; then
  source <(k9s completion zsh) && compdef _k9s k9s
fi

if iscmd terraform; then
  autoload -U +X bashcompinit && bashcompinit
  complete -o nospace -C /opt/homebrew/bin/terraform terraform
fi

