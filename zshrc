# add custom functions to fpath (needed for completion functions)
fpath=($HOME/zsh/functions $fpath)

#export FPATH=$FPATH
## load all custom functions
#for file in $HOME/.zsh/functions/*; do
   #echo $(basename $file)
   #autoload -U $(basename $file)
#done;
# load all settings
for file in $HOME/.zsh/*.zsh; do
        source $file
done;
# load local zshrc2 if it exists
if [[ -f $HOME/.zshrc2 ]]; then
   source $HOME/.zshrc2
fi
