## load all custom functions
fpath=($HOME/.zsh/functions $fpath)
for file in $HOME/.zsh/functions/*; do
   autoload -U $(basename $file)
done;
