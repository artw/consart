#
# set SSH_AGENT_ENABLE in zshrc.local to start agent on boot
#

SSH_AGENT_ENV=$HOME/.ssh-agent

function ssh-agent-stop {
  if which ssh-agent &>/dev/null; then
  # check if running, then kill
    if [[ -f $SSH_AGENT_ENV ]]; then
      source $SSH_AGENT_ENV
      kill $SSH_AGENT_PID
      rm $SSH_AGENT_ENV
    else
      return 1
    fi
  fi
}

function ssh-agent-start {
  if which ssh-agent &>/dev/null; then
  # run if not already
    if [[ -f $SSH_AGENT_ENV ]]; then
      source $SSH_AGENT_ENV
      if ps -p $SSH_AGENT_PID > /dev/null; then
        return
      fi
    fi
    ssh-agent -s | grep 'export' > $SSH_AGENT_ENV
    chmod 600 $SSH_AGENT_ENV
    source $SSH_AGENT_ENV
  fi
}

# create a symlink in case agent var already set by something else (like ssh ForwardAgent)
# this symlink is used by tmux
if [[ -S "$SSH_AUTH_SOCK" ]]; then
  test -d $HOME/.ssh || mkdir -p $HOME/.ssh
  ln -sf $SSH_AUTH_SOCK $HOME/.ssh/ssh-agent
# or run local agent if enabled
elif [[ "$SSH_AGENT_ENABLE" == "yes" ]]; then
  ssh-agent-start
fi
