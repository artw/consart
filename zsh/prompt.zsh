# allow variable substitution inside prompts
setopt prompt_subst

# draw user@host if ssh
if [[ -c $SSH_TTY ]]; then
  at='%n%B%F{yellow}@%f%b%m '
fi;

# red prompt if root
local -a prompt_color
if [[ $UID == 0 ]];then
  prompt_color=red
else
  prompt_color=white
fi

# vimode is set by a zle-keymap-select "hook"
PROMPT='$at%B%F{$prompt_color}%(!.#.$)%b%f '
RPROMPT='${vimode}%~ %F{blue}[%f%*%F{blue}]%f'
