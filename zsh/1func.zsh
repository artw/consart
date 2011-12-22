## load all custom functions
fpath=($HOME/.zsh/functions $fpath)
typeset -U fpath

for file in $HOME/.zsh/functions/*; do
   autoload -U $(basename $file)
done;
