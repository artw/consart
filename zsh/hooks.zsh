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

# indicate command mode in $vimode
function zle-keymap-select {
 if [[ -z $KEYMAP || $KEYMAP == vicmd ]]; then
   vimode="%B-- COMMAND --%b "
 else 
   vimode=""
 fi
 zle reset-prompt
}
# redefine standard zsh widget with this function
zle -N zle-keymap-select
