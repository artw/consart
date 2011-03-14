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

   sudo mount -o bind /dev $1/dev
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

