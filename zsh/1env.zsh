# ls colors 
#useful tool for lscolors: http://geoff.greer.fm/lscolors 
export LSCOLORS="ExGxcxdxbxegedabagecad"
export LS_COLORS="di=1;34:ln=1;36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
#

# enable colors in some tools
export CLICOLOR=1
#

# default pager
iscmd less && export PAGER=less
#

# set default editor
if iscmd vim; then
  export EDITOR=vim
  alias vi=vim
elif iscmd vi; then
  export EDITOR=vi
fi
#

# hostname (for title function)
  export HOSTNAME=`hostname`
#

# allows using C-S and C-Q in vim maps
if which stty > /dev/null;then
  stty -ixon
  stty stop ''
fi
#

# dirs for PATH
local path_dirs
path_dirs=(
   $HOME/.bin
   $HOME/.consart/bin

   /opt/sbin
   /opt/local/sbin
   /usr/local/sbin
   /usr/sbin
   /sbin

   /opt/bin
   /opt/local/bin
   /usr/local/bin
   /usr/bin
   /bin

   /usr/libexec

   /usr/X11R6/bin
)
#

# fix broken terms, like cygwin
export SHELL=`which zsh`
#

# os specific environment settings
case $OSTYPE in
  #darwin*)
  #;;
  
  openbsd*)
    export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/`uname -r`/packages/`uname -m`
  ;;

  #freebsd*)
  #;;

  #cygwin*)
  #;;

  #solaris*)
  #;;
  
  #linux*)
  #;;

esac
#

# rbenv specific stuff
if [[ -d $HOME/.rbenv ]];then 
  path_dirs+=$HOME/.rbenv/bin
  path_dirs+=$HOME/.rbenv/shims
  eval "$($HOME/.rbenv/bin/rbenv init -)"
fi
#

# set PATH
unset PATH
foreach dir in $path_dirs
  if [[ -d $dir ]]; then
    PATH=${PATH}:${dir}
  fi
end
PATH=$PATH[2,-1] # remove leading ":"
typeset -U path
export PATH
#
