export LSCOLORS=ExFxCxDxCxEGECACAGACAD

if which vim >/dev/null; then
	export EDITOR=vim
fi

foreach dir ($HOME/android-sdk-mac_86/tools $HOME/android-sdk-mac_86/platform-tools /usr/local/kde4 /opt/local/bin)
   if [[ -d $dir ]]; then
      export PATH=$PATH:$dir
   fi
end

case $OS_FLAVOR in
   openbsd)
      export TERM=wsvt25
      export PKG_PATH=ftp://ftp.bsd.lv/pub/OpenBSD/snapshots/packages/`uname -m`
      ;;
esac
