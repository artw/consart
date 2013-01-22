# load zshrc.local if it exists
if [[ -f $HOME/.zshrc_local ]] then
   source $HOME/.zshrc_local

# load everything else
for file in $HOME/.zsh/*.zsh; do
        source $file
done;

