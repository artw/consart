bindkey -v

bindkey -M vicmd "/" history-incremental-pattern-search-backward
bindkey -M vicmd "?" history-incremental-pattern-search-forward
bindkey -M vicmd "//" history-beginning-pattern-search-backward
bindkey -M vicmd "??" history-beginning-pattern-search-forward
bindkey -M vicmd "q" push-line
bindkey -M vicmd "u" undo

bindkey '^K' kill-whole-line
bindkey "\e[H" beginning-of-line        # Home (xorg)
bindkey "\e[1~" beginning-of-line       # Home (console)
bindkey "\e[4~" end-of-line             # End (console)
bindkey "\e[F" end-of-line              # End (xorg)
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
