# load all settings
for file in $HOME/.zsh/*.zsh; do
        source $file
done;

# load local zshrc2 if it exists
if [[ -f $HOME/.zshrc2 ]]; then
   source $HOME/.zshrc2
fi
