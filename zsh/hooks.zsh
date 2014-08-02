function chpwd {
  ls
}

function precmd {
  title "$HOSTNAME:${PWD/$HOME/~}"
}
  
function preexec {
  local -a cmd; cmd=(${(z)1})
  if [[ $cmd[1]:t == "ssh" ]]; then
    title $cmd[2] "$cmd[3,-1]"
  elif [[ $cmd[1]:t == "sudo" ]]; then
    title $HOSTNAME":" "#" $cmd[2]:t "$cmd[3,-1]"
  else
    title $HOSTNAME":" $cmd[1]:t "$cmd[2,-1]"
  fi
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
