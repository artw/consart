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

	{ eval "$GET_ID" ; } | ssh $1 "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys" || exit 1

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

