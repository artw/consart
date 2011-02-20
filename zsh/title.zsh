function title {
  if [[ $TERM == "screen" || $TERM == "screen.linux" ]]; then
    # Use these two for GNU Screen:
    print -nR $'\033k'$1$'\033'
    print -nR $'\033]0;'$2$'\a'
  elif [[ $TERM == "xterm" || $TERM == "xterm-color" || $TERM == "wsvt25" || $TERM == "xterm-256color" ]]; then
    # Use this one instead for XTerms:
    print -nR $'\033]0;'$*$'\a'
  fi
}
  
function precmd {
  title "`hostname -s`:${PWD/$HOME/~}"
  echo -ne '\033[?17;0;127c'
}
  
function preexec {
  emulate -L zsh
  local -a cmd; cmd=(${(z)1})
  if [[ $cmd[1]:t == "ssh" ]]; then
    title `hostname -s`":" "@"$cmd[2] "$cmd[3,-1]"
  elif [[ $cmd[1]:t == "sudo" ]]; then
    title `hostname -s`":" "#"$cmd[2]:t "$cmd[3,-1]"
  else
    title `hostname -s`":" $cmd[1]:t "$cmd[2,-1]"
  fi
}
