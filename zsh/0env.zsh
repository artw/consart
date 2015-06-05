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

  /usr/bin/vendor_perl
  /usr/X11R6/bin
  /usr/local/lib/kde4/libexec

  /usr/games/bin
)

# set $path
unset path
foreach dir in $path_dirs
  if [[ -d $dir ]]; then
    path+=$dir
  fi
end

typeset -U path

# dirs for FPATH
local -a fpath_dirs
fpath_dirs=(
  $HOME/.zsh/functions
  $HOME/.zsh/functions/Completion
  $HOME/.zsh/functions/$(uname)
)

# set $fpath
foreach dir in $fpath_dirs
  if [[ -d $dir ]]; then
    fpath=($dir $fpath)
    # autoload all functions within custom fpath
    foreach fn in $(find $dir -maxdepth 1 -type f ); do
      autoload -Uz $(basename $fn)
    done
  fi
end
typeset -U fpath
 
# ls colors 
#useful tool for lscolors: http://geoff.greer.fm/lscolors 
export LSCOLORS="ExGxcxdxbxegedabagecad"
export LS_COLORS="di=1;34:ln=1;36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# enable colors in some tools
export CLICOLOR=1

# fix broken terms (like cygwin)
export SHELL=$(which zsh)

# add home to cdpath
cdpath+=$HOME

# os specific environment settings
case $OSTYPE in
  darwin*)
    cdpath+=/Volumes
    export HOSTNAME=`hostname -s`
  ;;
  
  openbsd*)
    export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/$(uname -r)/packages/$(uname -m)
    export HOSTNAME=`hostname -s`
  ;;

  freebsd*)
    export HOSTNAME=`hostname -s`
  ;;

  cygwin|msys)
    export HOSTNAME=$HOST
  ;;

  solaris*)
    export HOSTNAME=`hostname -s`
  ;;
  
  linux*)
    export HOSTNAME=`hostname -s`
  ;;

esac

# default pager
which less >/dev/null && export PAGER=less

# set default editor
if which vim >/dev/null; then
  export EDITOR=vim
elif which vi >/dev/null; then
  export EDITOR=vi
fi

# unbind C-S and C-Q for use in vim maps
if which stty > /dev/null;then
  stty -ixon
  stty stop ''
fi
