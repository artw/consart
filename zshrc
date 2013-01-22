# load zshrc.local if it exists
if [[ -f $HOME/.zshrc.local ]] then
   source $HOME/.zshrc.local
fi

# load everything else
for file in $HOME/.zsh/*.zsh; do
        source $file
done;

