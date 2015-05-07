# load zshrc.local
if [[ -f $HOME/.zshrc.local ]] then
   source $HOME/.zshrc.local
fi

# load consart
for file in $HOME/.zsh/*sh; do
        source $file
done;

# load zshrc.local2
if [[ -f $HOME/.zshrc.local2 ]] then
   source $HOME/.zshrc.local2
fi
