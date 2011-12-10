function ssh-copy-id {
	ID_FILE="${HOME}/.ssh/id_rsa.pub"

	if [ -z "`eval $GET_ID`" ] && [ -r "${ID_FILE}" ] ; then
	  GET_ID="cat ${ID_FILE}"
	fi

	if [ -z "`eval $GET_ID`" ]; then
	  notice "$0: ERROR: No identities found" >&2
	  return 1
	fi

	if [ "$#" -lt 1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
	  notice "Usage: $0 [-i [identity_file]] [user@]machine" >&2
	  return 1
	fi

	{ eval "$GET_ID" ; } | ssh $1 "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys" || return 1

	echo "Done."
}


function ssh-del-key {
	linenum=$1
	filepath="${HOME}/.ssh/known_hosts"
	if [[ $linenum -ge 1 ]]; then
		sed -i .bak ${linenum}d ${filepath}
	else
		echo "Deletes a line from ${filepath}"
		echo "Usage: $0 <line number>"
	fi
}

function notice {
   if [ -x `which growlnotify` ]; then
      growlnotify -t 'zsh notice' -m "$1"
   fi
   echo $1
}

function xorg-nvidia {
   if [[ $OS_FLAVOR == 'FreeBSD' ]]; then
      kldload nvidia
   fi

	sudo cp -i ~/.consart/cfg/nvidia.xorg.conf /etc/X11/xorg.conf
}

function chroot-mount {
   sudo mount -o bind /dev $1/dev
   sudo mount -o bind /sys $1/sys
   sudo mount -o bind /proc $1/proc
}
# extract function, taken from oh-my-zsh
function extract() {
    unset REMOVE_ARCHIVE
    
    if test "$1" = "-r"; then
        REMOVE=1
        shift
    fi
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2) tar xvjf $1;;
      *.tar.gz) tar xvzf $1;;
      *.tar.xz) tar xvJf $1;;
      *.tar.lzma) tar --lzma -xvf $1;;
      *.bz2) bunzip $1;;
      *.rar) unrar $1;;
      *.gz) gunzip $1;;
      *.tar) tar xvf $1;;
      *.tbz2) tar xvjf $1;;
      *.tgz) tar xvzf $1;;
      *.zip) unzip $1;;
      *.Z) uncompress $1;;
      *.7z) 7z x $1;;
      *) echo "'$1' cannot be extracted via >extract<";;
    esac

    if [[ $REMOVE_ARCHIVE -eq 1 ]]; then
        echo removing "$1";
        /bin/rm "$1";
    fi

  else
    echo "'$1' is not a valid file"
  fi
}

recompl() {
   local f
   f=(~/.zsh/functions/*(.))
   unfunction $f:t 2> /dev/null
   autoload -U $f:t
}

mvln() {         
   if [[ -d $2 ]]; then
      mv $1 $2 && ln -sf $2/${1##*/} $1
   else
      mv $1 $2 && ln -sf $2 $1
   fi
}

figlet-motd() {
   figlet $1 | ssh root@$2 "rm /etc/motd && tee /etc/motd"
}
   
syng() {
   syng-stop $1;
   ssh $1 synergys -1 -a localhost && 
   ssh -fN -L24800:localhost:24800 $1 && 
   synergyc -1 localhost
}

syng-stop() {
   killall synergyc > /dev/null ;
   ssh $1 killall synergys > /dev/null ;
   kill `ps x | grep "24800:localhost:24800" | grep -v grep | awk '{ print $1}'` > /dev/null ;
}

kvm-vnc() {
   echo server: $1
   echo vmid: $2
   echo vncport: $3
   ssh -L $3:127.0.0.1:$3 root@$1 "nc -l -p $3 -c 'qm vncproxy $2 megapass'"
}

trim-enable() {
#1. Backup the file we’re patching
   sudo cp /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage.original

#2. Patch the file to enable TRIM support
   sudo perl -pi -e 's|(\x52\x6F\x74\x61\x74\x69\x6F\x6E\x61\x6C\x00{1,20})[^\x00]{9}(\x00{1,20}\x51)|$1\x00\x00\x00\x00\x00\x00\x00\x00\x00$2|sg' /System/Library/Extensions/IOAHCIFamily.kext/Contents/PlugIns/IOAHCIBlockStorage.kext/Contents/MacOS/IOAHCIBlockStorage

#3. Clear the system kernel extension cache
   sudo kextcache -system-prelinked-kernel
   sudo kextcache -system-caches   
}
root-permissions() { 
   sudo chown -R root:wheel $1
   sudo chmod -R 755 $1
}
