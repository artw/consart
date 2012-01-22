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
elif which vi &>/dev/null; then
   export EDITOR=vi
fi
###

# set path in correct order, ignoring global settings
unset PATH
foreach dir (
   /opt/oracle/otk/current/bin
   /usr/local/Cellar/ruby/1.9.3-p0/bin
   $HOME/.consart/bin
   /usr/local/bin
   /opt/local/bin
   /Applications/VMware\ Fusion.app/Contents/Library
   /usr/bin
   /bin
   /usr/local/sbin
   /opt/local/sbin
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
    if [ release -eq '5.1' ]; then release = 'snapshots' fi
    export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/$release/packages/`uname -m`
    export CVSROOT=anoncvs@anoncvs.estpak.ee:/OpenBSD
  ;;
  freebsd*)
    export PACKAGESITE=ftp://ftp.lv.freebsd.org/pub/FreeBSD/ports/`uname -m`/packages-8-stable/Latest/
    export TERMPATH=~/.consart/termcap:/usr/local/etc/termcap:/etc/termcap
  ;;
  cygwin*)
    export TERM=xterm-256color
  ;;
esac
## cygwin's differences from *nix
case $OSTYPE in 
  cygwin)
    export HOSTNAME=`hostname`
  ;;
  *) 
    export HOSTNAME=`hostname -s`
  ;;
esac
###
