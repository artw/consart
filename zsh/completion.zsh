autoload -U zutil
autoload -U complist
autoload -Uz compinit

# Only run full compinit once per day, use cache otherwise
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

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

# ignore completion functions for not existent commands
zstyle ':completion:*:functions' ignored-patterns '_*'

# load custom compdefs
for f in ~/.zsh/functions/Completion/**; do
  compdef $f:t ${${f:t}:1:$}
done


iscmd kubectl && $(source <(command kubectl completion zsh&))
iscmd k9s && $(source <(command k9s completion zsh&) && compdef _k9s k9s&)
# iscmd rclone && source <(command rclone completion zsh)
iscmd gog && source <(command gog completion zsh&)
