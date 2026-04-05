if [[ -n $SSH_CONNECTION ]]; then
  TITLE_PREFIX=$HOSTNAME:
fi

function chpwd {
  # ls
}

function precmd {
  # pin prompt to bottom of screen (once on shell start)
  if [[ -z $_prompt_pinned ]]; then
    printf '\n%.0s' {1..$((LINES-1))}
    _prompt_pinned=1
  fi
  vcs_info
  title "${TITLE_PREFIX}${PWD/$HOME/~}"
}
  
function preexec {
(
 setopt nopromptsubst
 local -a cmd; cmd=(${(z)1})
 if [[ $cmd[1]:t == "ssh" || $cmd[1]:t == "mosh" ]]; then
   #title $cmd[2] "$cmd[3,-1]"
   title $cmd[2]
 elif [[ $cmd[1]:t == "sudo" ]]; then
   title ${TITLE_PREFIX} "#" $cmd[2]:t "$cmd[3,-1]"
 else
   title ${TITLE_PREFIX} $cmd[1]:t "$cmd[2,-1]"
 fi
 tmux-env-refresh
)
}

# indicate command mode in $vimode for use in prompt
vicmd_prompt="%B-- COMMAND --%b "
function zle-keymap-select {
 if [[ -z $KEYMAP || $KEYMAP == vicmd ]]; then
   vimode=$vicmd_prompt
 else 
   vimode=""
 fi
 zle reset-prompt
}
zle -N zle-keymap-select

# reset vimode on zle newline
function zle-line-finish {
  vimode=""
}
zle -N zle-line-finish

# set env variables from tmux update-environment
function tmux-env-refresh {
  if [[ -n "$TMUX" ]]; then
    for e in $(tmux show-options -gv update-environment); do
      var=$(tmux show-environment | grep "^${e}=") 
      test -n "${var}" && export $var
    done;
  fi
}
