autoload colors; colors;
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi
#setopt cdablevarS
setopt prompt_subst

PROMPT='%{$fg[$NCOLOR]%}%B%m%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} $(git_prompt_info)%(!.#.$) '
RPROMPT='[%*]'
