# vi keymap
bindkey -v

bindkey -M vicmd "/" history-incremental-pattern-search-backward
bindkey -M vicmd "?" history-incremental-pattern-search-forward
zle -N history-beginning-pattern-search-backward
zle -N history-beginning-pattern-search-forward
bindkey -M vicmd "//" history-beginning-pattern-search-backward
bindkey -M vicmd "??" history-beginning-pattern-search-forward
bindkey -M vicmd "u" undo               # vi undo is crap
bindkey -M vicmd "q" push-input         # clear and add this line to history, execute other command before it comes back
bindkey -M vicmd "v" edit-command-line  # edit line in vim
bindkey "^E" edit-command-line             # Ctrl-E: edit line in $EDITOR

bindkey "\eOH" beginning-of-line        # Home
bindkey "\e[H" beginning-of-line        # Home (xorg)
bindkey "\e[1~" beginning-of-line       # Home (console)
bindkey "\e[7~" beginning-of-line       # Home (bsd?)
bindkey "\eOF" end-of-line              # End
bindkey "\e[F" end-of-line              # End (xorg)
bindkey "\e[4~" end-of-line             # End (console)
bindkey "\e[8~" end-of-line             # End (bsd?)
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey "^P" up-line-or-history         # Ctrl-P: previous history

# sudo plugin (inlined from ohmyzsh) — Esc Esc prepends/removes sudo
__sudo-replace-buffer() {
  local old=$1 new=$2 space=${2:+ }
  if [[ $CURSOR -le ${#old} ]]; then
    BUFFER="${new}${space}${BUFFER#$old }"
    CURSOR=${#new}
  else
    LBUFFER="${new}${space}${LBUFFER#$old }"
  fi
}
sudo-command-line() {
  [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"
  local WHITESPACE=""
  if [[ ${LBUFFER:0:1} = " " ]]; then
    WHITESPACE=" "
    LBUFFER="${LBUFFER:1}"
  fi
  {
    local EDITOR=${SUDO_EDITOR:-${VISUAL:-$EDITOR}}
    if [[ -z "$EDITOR" ]]; then
      case "$BUFFER" in
        sudo\ -e\ *) __sudo-replace-buffer "sudo -e" "" ;;
        sudo\ *)     __sudo-replace-buffer "sudo" "" ;;
        *)           LBUFFER="sudo $LBUFFER" ;;
      esac
      return
    fi
    local cmd="${${(Az)BUFFER}[1]}"
    local realcmd="${${(Az)aliases[$cmd]}[1]:-$cmd}"
    local editorcmd="${${(Az)EDITOR}[1]}"
    if [[ "$realcmd" = (\$EDITOR|$editorcmd|${editorcmd:c}) \
      || "${realcmd:c}" = ($editorcmd|${editorcmd:c}) ]] \
      || builtin which -a "$realcmd" | command grep -Fx -q "$editorcmd"; then
      __sudo-replace-buffer "$cmd" "sudo -e"
      return
    fi
    case "$BUFFER" in
      $editorcmd\ *)  __sudo-replace-buffer "$editorcmd" "sudo -e" ;;
      \$EDITOR\ *)    __sudo-replace-buffer '$EDITOR' "sudo -e" ;;
      sudo\ -e\ *)    __sudo-replace-buffer "sudo -e" "$EDITOR" ;;
      sudo\ *)        __sudo-replace-buffer "sudo" "" ;;
      *)              LBUFFER="sudo $LBUFFER" ;;
    esac
  } always {
    LBUFFER="${WHITESPACE}${LBUFFER}"
    zle redisplay
  }
}
zle -N sudo-command-line
bindkey -M emacs '\e\e' sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line
bindkey -M viins '\e\e' sudo-command-line
