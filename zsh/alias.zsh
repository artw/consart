# hist ignore some commands:
  alias -g ls=' ls'
  alias -g cd=' cd'
# system speciefic aliases:
case $OSTYPE in 
linux*)
  alias -g grep="grep --color=auto"
  alias -g ls="ls --color=auto -F"
  iscmd grub-mkconfig && alias -g grub2-cfg="grub-mkconfig -o /boot/grub/grub.cfg"
  # arch
  if iscmd yaourt; then
    alias ya="yaourt"
    alias yau="yaourt -Syu --devel --aur"
  fi
  # gentoo
  if iscmd emerge; then
    alias -g em="emerge"
    alias -g emc="emerge -C"
    alias -g esync="eix-sync"
    alias -g udav="emerge -uDavN world"
  fi  
  # debian
  if iscmd apt-get; then
    alias -g apt="apt-get"
    alias -g apti="apt-get install"
    alias -g aptr="apt-get remove"
    alias -g aptu="apt-get update"
    alias -g aptup="apt-get upgrade"
    alias -g apts="apt-cache search"
  fi
  # MIPS device (router) with optware
  if [[ $(uname -m) -eq 'mips' ]]; then
    iscmd hg-py2.7 && alias -g hg="hg-py2.7"
  fi
;;

cygwin)
  alias -g ls="ls --color=auto -F"
  alias ping="nocorrect /cygdrive/c/windows/system32/ping.exe"
;;

darwin*) 
  alias -g grep="grep --color=auto"
  alias -g ls="ls -GF"
  alias eject="diskutil eject"
  alias finder="open -a Finder"
  alias refinder="killall Finder && open -a TotalFinder"
  alias run="open -a"
  alias locate="mdfind -name"
  alias rm_dsstore="find . -name .DS_Store -delete"

  iscmd htop && alias htop="sudo htop"
  iscmd mvim && alias gvim="mvim"
  iscmd brew && alias brewup="brew update && brew upgrade && brew cleanup"
;;

freebsd*)
  alias -g ls="ls -FIG"
  alias -g portupdate="portsnap fetch update"
  alias -g pkgi="pkg_add -r" 
  alias -g pkga="pkg_add -r" 
  alias -g pkgr="pkg_delete" 
  alias -g pkgd="pkg_delete" 
;;

openbsd*)
  alias -g pkgi="pkg_add -r" 
  alias -g pkga="pkg_add -r" 
  alias -g pkgr="pkg_delete" 
  alias -g pkgd="pkg_delete" 
  alias -g cvsupd="cvsup -g -L 2 /etc/cvsupfile"
  alias -g out-of-date="/usr/ports/infrastructure/build/out-of-date"
  iscmd colorls && alias ls="colorls -GF"
  alias pf="pfctl"
  alias rpf="pfctl -f /etc/pf.conf"
  alias epf="$EDITOR /etc/pf.conf"
;;

solaris*)
  alias ls="ls --color=auto"
;;
esac

## universal aliases
alias -g e=$EDITOR
alias _e='sudo $EDITOR'
alias -g ge=gvim

if iscmd sudo; then
  alias sudo="sudo -E"
  alias '#'='sudo'
  alias '£'='sudo'
fi

alias rezsh="rehash && source $HOME/.zshrc"

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir'

alias -g l='ls -l'
alias -g la='ls -la'
alias -g lah='ls -lah'

alias -g L='| less'
alias -g G='| grep'
alias -g GV='| grep -v'
alias -g N='| sort -n'

alias -g dun='du -kax'

alias -g ...='cd ../..'
alias -g ....='cd ../../..'

if iscmd rsync; then
  alias -g cpr='rsync -avhP'
  alias -g mvr='rsync -avhP --remove-source-files'
fi

alias h='fc -l 1'
alias hs='fc -l 1 | grep '
alias dr='dirs -v'

if iscmd tmux; then
  alias tx="tmux -2 attach || tmux -2 new"
  alias tmux-b="tmux set-option -g prefix C-b"
  alias tmux-a="tmux set-option -g prefix C-a"
fi

if iscmd hg; then
  alias hgu="hg pull -u"
  alias cup="cd ~/.consart && hgu && cd -"
fi

if iscmd ssh; then
  alias -g "@"="ssh"
  alias @vnc="ssh -L5901:localhost:5900 "
fi

if iscmd wget; then
  alias -g wget="wget --trust-server-names"
fi

# rlwrap from oracletoolkit
if iscmd rlwrap; then
  CONF="/opt/oracle/otk/current/conf"
  alias rman='touch $CONF/rlwrap/rman.key; rlwrap -i -f $CONF/rlwrap/rman.key rman'
  alias sqlplus='touch $CONF/rlwrap/oracle.key; rlwrap -i -f $CONF/rlwrap/oracle.key sqlplus'
fi

alias wake-aquabox="ssh poseidon /opt/local/bin/wake-aquabox"
