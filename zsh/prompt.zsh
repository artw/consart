# allow variable substitution inside prompts
setopt prompt_subst

# show host if ssh
if [[ -c $SSH_TTY ]]; then
  at='%m'
fi;

# red prompt if root
local -a prompt_color
if [[ $UID == 0 ]];then
  prompt_color=red
else
  prompt_color=yellow
fi

# vimode is set by a zle-keymap-select "hook"
PROMPT='$at%B%F{$prompt_color}%(!.#.>)%f%b '
RPROMPT='${vimode} %F{orange}%f ${vcs_info_msg_0_} $ZSH_KUBECTL_PROMPT (${?}) %F{blue}[%f%*%F{blue}]%f'
