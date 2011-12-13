case $OSTYPE in 
   cygwin)
      HOSTNAME=`hostname`
      ;;
   *) 
      HOSTNAME=`hostname -s`
      ;;
esac
   
function title {
  if [[ $TERM == "screen" || $TERM == "screen.linux" || $TERM == "screen-256color" ]]; then
    # pane title
    #print -nR $'\033k'$1$'\033'
    # window title
    print -nR $'\033]0;'$2$'\a'
  elif [[ $TERM == "xterm" || $TERM == "xterm-color" || $TERM == "wsvt25" || $TERM == "xterm-256color" ]]; then
    # Use this one instead for XTerms:
    print -nR $'\033]0;'$*$'\a'
  fi
}
  
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
