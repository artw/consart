## load all functions

# generic fpath
local -a consart_fpath
consart_fpath=( $HOME/.zsh/functions $HOME/.zsh/functions/Completion )
#

# os specific fpath
local -a consart_fpath_os_specific
consart_fpath_os_specific="$HOME/.zsh/functions/$(uname)" 
if [[ -d $consart_fpath_os_specific ]]; then
  consart_fpath+=$consart_fpath_os_specific
fi
#

# set fpath
fpath=($consart_fpath $fpath)
typeset -U fpath
#

# autoload all functions within our fpath
foreach function in $(find $consart_fpath -maxdepth 1 -type f ); do
  autoload -Uz $(basename $function)
done
