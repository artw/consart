# load external plugins if available
local -a zsh_plugins
zsh_plugins=(
    $HOME/.zsh/external/z/z.sh
    $HOME/.zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  )

foreach script in $zsh_plugins
  test -f $script && source $script
end

# load rbenv if available
if [[ -d $HOME/.rbenv ]];then 
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

