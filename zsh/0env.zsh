# ls colors 
# useful tool for lscolors: http://geoff.greer.fm/lscolors 
export LSCOLORS="ExGxcxdxbxegedabagecad"
export LS_COLORS="di=1;34:ln=1;36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"

# enable colors in some tools
export CLICOLOR=1
export GREP_COLOR=32
export GREPCOLOR=32

# pager
if which less >/dev/null; then
   export PAGER=less
elif which more >/dev/null; then
   export PAGER=more
fi

# editor
if which vim >/dev/null; then
	export EDITOR=vim
elif which vi >/dev/null; then
   export EDITOR=vi
fi
# add to PATH 
foreach dir (
   /usr/local/bin
   $HOME/Applications/android-sdk-mac_86/tools
   $HOME/Applications/android-sdk-mac_86/platform-tools
   /usr/local/kde4
   /opt/local/bin
   /Applications/VMware\ Fusion.app/Contents/Library
   /usr/libexec
   $HOME/.consart/bin
   )
   if [[ -d $dir ]]; then
      export PATH=$dir:$PATH
   fi
end

case $OSTYPE in
   openbsd*)
      export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/`uname -r`/packages/`uname -m`
      ;;
   freebsd*)
      export PACKAGESITE=ftp://ftp.lv.freebsd.org/pub/FreeBSD/ports/`uname -m`/packages-8-stable/Latest/
      export TERMPATH=~/.consart/termcap:/usr/local/etc/termcap:/etc/termcap
      ;;
esac
