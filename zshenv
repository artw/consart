# disable global RCS files that can override consart
unsetopt global_rcs
emulate sh -c 'source /etc/profile'

# if TERM has no terminfo entry (e.g. xterm-ghostty on a remote without ghostty installed),
# fall back to xterm-256color before anything terminal-dependent runs
if [[ -n $TERM ]] && ! infocmp "$TERM" &>/dev/null; then
  export TERM=xterm-256color
fi
