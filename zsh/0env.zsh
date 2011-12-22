# ls colors 
# useful tool for lscolors: http://geoff.greer.fm/lscolors 
export LSCOLORS="ExGxcxdxbxegedabagecad"
export LS_COLORS="di=1;34:ln=1;36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
###

# enable colors in some tools
export CLICOLOR=1
###

# set default pager
if which less >/dev/null; then
   export PAGER=less
elif which more >/dev/null; then
   export PAGER=more
fi
###

# set default editor
if which vim >/dev/null; then
	export EDITOR=vim
elif which vi >/dev/null; then
   export EDITOR=vi
fi
###

# set path in correct order, ignoring global settings
unset PATH
foreach dir (
   $HOME/.consart/bin
   /usr/local/bin
   /opt/local/bin
   /Applications/VMware\ Fusion.app/Contents/Library
   $HOME/Applications/android-sdk-mac_86/tools
   $HOME/Applications/android-sdk-mac_86/platform-tools
   /usr/bin
   /bin
   /usr/local/sbin
   /opt/local/sbin
   /usr/sbin
   /sbin
   /usr/libexec
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
      export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/`uname -r`/packages/`uname -m`
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
