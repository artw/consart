SSH_AGENT_ENV=$HOME/.ssh-agent

function ssh-agent-stop {
   killall ssh-agent
   rm $SSH_AGENT_ENV
}

function ssh-agent-start {
   if [[ ! -f $SSH_AGENT_ENV ]]; then
     ssh-agent | grep 'export' > $SSH_AGENT_ENV
     chmod 600 $SSH_AGENT_ENV
   fi
   source $SSH_AGENT_ENV
}

if [[ $OS != "macosx" ]];then
   ssh-agent-start;
fi
