function precmd {
  title "$HOSTNAME:${PWD/$HOME/~}"
  echo -ne '\033[?17;0;127c'
}
  
function preexec {
  emulate -L zsh
  local -a cmd; cmd=(${(z)1})
  if [[ $cmd[1]:t == "ssh" ]]; then
    title $HOSTNAME":" "@"$cmd[2] "$cmd[3,-1]"
  elif [[ $cmd[1]:t == "sudo" ]]; then
    title $HOSTNAME":" "#"$cmd[2]:t "$cmd[3,-1]"
  else
    title $HOSTNAME":" $cmd[1]:t "$cmd[2,-1]"
  fi
}