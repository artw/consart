# allow variable substitution inside prompts
setopt prompt_subst

# draw user@host if ssh
if [[ -c $SSH_TTY ]]; then
  at='%n%B%F{yellow}@%f%b%m:'
fi;

if [[ $UID == 0 ]];then
  color=red
else
  color=blue
fi

PROMPT='%B%F{$color}%(!.#.$)%b%f '
RPROMPT='$at%~ %F{blue}[%F{white}%*%F{blue}]%f'
