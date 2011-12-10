## load all custom functions
fpath=($HOME/.zsh/functions $fpath)
for file in $HOME/.zsh/functions/*; do
   echo $(basename $file)
   autoload -U $(basename $file)
done;
