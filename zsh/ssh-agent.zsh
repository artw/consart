SSH_AGENT_ENV=$HOME/.ssh-agent

function ssh-agent-stop {
   # check if running, then kill
   if [[ -f $SSH_AGENT_ENV ]]; then
      source $SSH_AGENT_ENV
      kill $SSH_AGENT_PID
      rm $SSH_AGENT_ENV
   else
      return 1
   fi
}

function ssh-agent-start {
   # run if not already
   if [[ -f $SSH_AGENT_ENV ]]; then
     source $SSH_AGENT_ENV
     ps -p $SSH_AGENT_PID > /dev/null
     if [[ $? -eq 0 ]]; then
        return
     fi
   fi
   ssh-agent -s | grep 'export' > $SSH_AGENT_ENV
   chmod 600 $SSH_AGENT_ENV
   source $SSH_AGENT_ENV
}
# run automatically, comment this if not needed
   ssh-agent-start;
