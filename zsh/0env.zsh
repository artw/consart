# ls colors 
#useful tool for lscolors: http://geoff.greer.fm/lscolors 
export LSCOLORS="ExGxcxdxbxegedabagecad"
export LS_COLORS="di=1;34:ln=1;36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# enable colors in some tools
export CLICOLOR=1

# default pager
which less >/dev/null && export PAGER=less

# set default editor
if which vim >/dev/null; then
  export EDITOR=vim
  alias vi=vim
elif which vi >/dev/null; then
  export EDITOR=vi
fi

# hostname (for title function)
  export HOSTNAME=`hostname -s`

# unbind C-S and C-Q for use in vim maps
if which stty > /dev/null;then
  stty -ixon
  stty stop ''
fi

# dirs for PATH
local -a path_dirs
path_dirs=(
   $HOME/.bin
   $HOME/.vim/dist/bin

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
   /usr/local/kde4/bin
)

# fix broken terms (like cygwin)
export SHELL=$(which zsh)

# add home to cdpath
cdpath+=$HOME

# os specific environment settings
case $OSTYPE in
  darwin*)
    cdpath+=/Volumes
  ;;
  
  openbsd*)
    export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/$(uname -r)/packages/$(uname -m)
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

# oracle stuff (if set in zshrc.local) 
if [[ -d $ORACLE_HOME_DB || -d $ORACLE_HOME_GRID ]]; then
  if [[ -d $ORACLE_HOME_GRID ]]; then
    export ORACLE_HOME=$ORACLE_HOME_GRID
    path_dirs+=${ORACLE_HOME_GRID}/bin
  fi
  if [[ -d $ORACLE_HOME_DB ]]; then
    export ORACLE_HOME=$ORACLE_HOME_DB
    path_dirs+=${ORACLE_HOME_DB}/bin
  fi
  export NLS_DATE_FORMAT="dd-mm-yy hh24:mi:ss"
fi
 
# set $path
unset path
foreach dir in $path_dirs
  if [[ -d $dir ]]; then
    path+=$dir
  fi
end

typeset -U path
