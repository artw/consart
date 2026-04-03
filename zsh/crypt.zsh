#
# gocryptfs vault integration
# ciphertext: ~/sync/crypt  (synced via Resilio)
# mountpoint:  ~/.crypt     (local plaintext)
#

CRYPT_ENC="${HOME}/sync/crypt"
CRYPT_MNT="${HOME}/.crypt"

function _crypt_check_gocryptfs {
  if ! iscmd gocryptfs; then
    echo "crypt: gocryptfs not found"
    printf "Install it now? [y/N]: "
    read -q && echo && install_gocryptfs || return 1
  fi
}

function _crypt_is_mounted {
  case $OSTYPE in
    linux*)  mountpoint -q "$CRYPT_MNT" 2>/dev/null ;;
    darwin*) /sbin/mount 2>/dev/null | grep -q " on ${CRYPT_MNT} \| on ${CRYPT_MNT}$" ;;
  esac
}

function crypt-mount {
  _crypt_check_gocryptfs || return 1
  if _crypt_is_mounted; then
    echo "crypt: already mounted at $CRYPT_MNT"
    return 0
  fi
  if [[ ! -d "$CRYPT_ENC" ]]; then
    echo "crypt: encrypted dir not found: $CRYPT_ENC"
    return 1
  fi
  [[ -d "$CRYPT_MNT" ]] || mkdir -p "$CRYPT_MNT"
  local -a _gocryptfs_opts=()
  [[ $(stat -f -c %T "$CRYPT_ENC" 2>/dev/null) == btrfs ]] && _gocryptfs_opts+=(-noprealloc)
  gocryptfs $_gocryptfs_opts "$CRYPT_ENC" "$CRYPT_MNT" || return 1
  # in distrobox, mount propagation is broken — offer to also mount on the host
  if [[ -n "$DISTROBOX_ENTER_PATH" ]]; then
    if ! distrobox-host-exec bash -c "mountpoint -q $CRYPT_MNT" 2>/dev/null; then
      printf "Also mount on the host? [y/N]: "
      if read -q; then
        echo
        distrobox-host-exec gocryptfs $_gocryptfs_opts "$CRYPT_ENC" "$CRYPT_MNT"
      else
        echo
      fi
    fi
  fi
}

function crypt-umount {
  if ! _crypt_is_mounted; then
    echo "crypt: not mounted"
    return 1
  fi
  case $OSTYPE in
    linux*)  fusermount3 -u "$CRYPT_MNT" 2>/dev/null || fusermount -u "$CRYPT_MNT" ;;
    darwin*) umount "$CRYPT_MNT" ;;
  esac
}

function crypt-init {
  _crypt_check_gocryptfs || return 1
  if [[ -d "$CRYPT_ENC" && -f "${CRYPT_ENC}/gocryptfs.conf" ]]; then
    echo "crypt: already initialised at $CRYPT_ENC"
    return 1
  fi
  mkdir -p "$CRYPT_ENC"
  gocryptfs -init "$CRYPT_ENC"
}

function crypt-status {
  if _crypt_is_mounted; then
    echo "crypt: mounted at $CRYPT_MNT"
  else
    echo "crypt: not mounted (run crypt-mount)"
  fi
}
