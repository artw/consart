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

# set path in correct order, ignoring global settings
unset PATH
foreach dir (
   # Oracle
   /opt/oracle/otk/current/bin 
   #-#
   # OSX
   /usr/local/Cellar/ruby/1.9.3-p125/bin
   /usr/local/Cellar/ruby/1.9.3-p194/bin
   /Applications/VMware\ Fusion.app/Contents/Library
   #-#
   # Cygwin
   #/c/windows
   #/c/windows/system32
   #-# too slow startup :(
   $HOME/.consart/bin
   /usr/local/bin
   /opt/local/bin
   /usr/bin
   /bin
   /usr/local/sbin
   /opt/local/sbin
   /opt/bin
   /usr/sbin
   /sbin
   /usr/libexec
   /usr/X11R6/bin
   )
   if [[ -d $dir ]]; then
      PATH=${PATH}:${dir}
   fi
end
## remove dups and export
typeset -U path
export PATH
###

# os speciefic environment settings
case $OSTYPE in
  openbsd*)
    release=`uname -r`
    if [ $release = '5.1' ]; then 
      release='snapshots'
    fi
    export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/${release}/packages/`uname -m`
    export CVSROOT=anoncvs@anoncvs.estpak.ee:/OpenBSD
  ;;
  freebsd*)
    export PACKAGESITE=ftp://ftp.lv.freebsd.org/pub/FreeBSD/ports/`uname -m`/packages-`uname -r | cut -c1`-stable/Latest/
    export TERMPATH=~/.consart/termcap:/usr/local/etc/termcap:/etc/termcap
  ;;
esac
## 
case $OSTYPE in 
  cygwin*)
    export HOSTNAME=`hostname`
  ;;

  solaris*)
    export HOSTNAME=`hostname`
  ;;

  *) 
    export HOSTNAME=`hostname -s`
  ;;
esac
###
