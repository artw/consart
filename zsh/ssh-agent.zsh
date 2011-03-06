SSH_AGENT_ENV=$HOME/.ssh-agent

function ssh-stop {
   killall ssh-agent
   rm $SSH_AGENT_ENV
}

function ssh-start {
   if [[ ! -f $SSH_AGENT_ENV ]]; then
     ssh-agent | grep 'export' > $SSH_AGENT_ENV
     chmod 600 $SSH_AGENT_ENV
   fi
   source $SSH_AGENT_ENV
}
if [[ $OS_FLAVOR != "macosx" ]];then
   ssh-start
fi
