# ls colors 
# useful tool for lscolors: http://geoff.greer.fm/lscolors 
export LSCOLORS="ExGxcxdxbxegedabagecad"
export LS_COLORS="di=1;34:ln=1;36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
###

# enable colors in some tools
export CLICOLOR=1
###

# set default pager
if which vimpager &>/dev/null; then
  export PAGER=vimpager
elif which less &>/dev/null; then
  export PAGER=less
fi
###

# set default editor
if which vim &>/dev/null; then
  export EDITOR=vim
  alias vi=vim
elif which vi &>/dev/null; then
  export EDITOR=vi
fi
###

# dirs for PATH
path_dirs=(
   $HOME/.consart/bin
   $ORACLE_HOME/bin

   $HOME/.rbenv/bin
   $HOME/.rbenv/shims

   /sbin
   /usr/sbin
   /usr/local/sbin
   /opt/local/sbin

   /bin
   /usr/bin
   /usr/local/bin
   /opt/local/bin

   /usr/libexec

   /usr/X11R6/bin
)
###

# os specific environment settings
case $OSTYPE in
  darwin*)
    export HOSTNAME=`hostname`
  ;;
  
  openbsd*)
    release=`uname -r`
    export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/${release}/packages/`uname -m`
    export CVSROOT=anoncvs@anoncvs.estpak.ee:/OpenBSD
    export HOSTNAME=`hostname`
  ;;

  freebsd*)
    export PACKAGESITE=ftp://ftp.lv.freebsd.org/pub/FreeBSD/ports/`uname -m`/packages-`uname -r | cut -c1`-stable/Latest/
    export TERMPATH=~/.consart/termcap:/usr/local/etc/termcap:/etc/termcap
    export HOSTNAME=`hostname`
  ;;

  cygwin*)
    export HOSTNAME=`hostname`
  ;;

  solaris*)
    export HOSTNAME=`hostname`
  ;;

esac
###

# set PATH
unset PATH
foreach dir in $path_dirs
  if [[ -d $dir ]]; then
    PATH=${dir}:${PATH}
  fi
end
typeset -U path
export PATH
###
