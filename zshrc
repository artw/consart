# load zshrc.local
if [[ -f $HOME/.zshrc.local ]] then
   source $HOME/.zshrc.local
fi

source $HOME/.zsh/env.zsh
source $HOME/.zsh/option.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/bind.zsh
source $HOME/.zsh/ssh-agent.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/hooks.zsh

# load zshrc.local2
if [[ -f $HOME/.zshrc.local2 ]] then
   source $HOME/.zshrc.local2
fi
