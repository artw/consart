if which vim >/dev/null; then
	export EDITOR=vim
fi
# add to PATH 
foreach dir (/usr/sbin /usr/local/sbin $HOME/android-sdk-mac_86/tools $HOME/android-sdk-mac_86/platform-tools /usr/local/kde4 /opt/local/bin)
   if [[ -d $dir ]]; then
      export PATH=$dir:$PATH
   fi
end

case $OS_FLAVOR in
   openbsd)
      export TERM=wsvt25
      export PKG_PATH=ftp://ftp.eu.openbsd.org/pub/OpenBSD/`uname -r`/packages/`uname -m`
      ;;
   freebsd)
      export PACKAGESITE=ftp://ftp.lv.freebsd.org/pub/FreeBSD/ports/`uname -m`/packages-8-stable/Latest/
      export TERMPATH=~/.consart/termcap:/usr/local/etc/termcap:/etc/termcap
      ;;
esac


export PATH=${HOME}/.consart/bin:${PATH}
