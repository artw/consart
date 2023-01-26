# load zshrc.local
if [[ -f $HOME/.zshrc.local ]] then
   source $HOME/.zshrc.local
fi

if [[ "$P10K_ENABLE" == "yes" ]]; then
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

source $HOME/.zsh/env.zsh
source $HOME/.zsh/option.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/prompt.zsh
source $HOME/.zsh/bind.zsh
source $HOME/.zsh/ssh-agent.zsh
source $HOME/.zsh/plugins.zsh
source $HOME/.zsh/hooks.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/alias.zsh

# load zshrc.local2
if [[ -f $HOME/.zshrc.local2 ]] then
   source $HOME/.zshrc.local2
fi

f=$HOME/.zsh/octopus.zsh ; test -f $f && source $f
