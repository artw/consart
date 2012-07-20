# system speciefic aliases:
case $OSTYPE in 
linux*)
  alias -g grep="grep --color=auto"
  alias -g ls="ls --color=auto -F"
  # arch
  if iscmd yaourt; then
    alias ya="yaourt"
    alias yau="yaourt -Syu --devel --aur"
  fi
  # gentoo
  if iscmd emerge; then
    alias em="sudo emerge"
    alias emc="sudo emerge"
    alias esync="sudo eix-sync"
    alias udav="sudo emerge -uDavN world"
  fi  
  # debian
  if iscmd apt-get; then
    alias apt="sudo apt-get"
    alias apti="sudo apt-get install"
    alias aptr="sudo apt-get remove"
    alias aptu="sudo apt-get update"
    alias aptup="sudo apt-get upgrade"
    alias apts="sudo apt-cache search"
  fi
;;

cygwin)
  alias -g ls="ls --color=auto -F"
  alias ping="nocorrect ping"
;;

darwin*) 
  alias -g ogrep="grep --color=auto"
  alias -g ls="ls -GF"
  alias -g eject="diskutil eject"
  alias finder="open -a Finder"
  alias refinder="killall Finder && open -a TotalFinder"
  alias run="open -a"
  alias locate="mdfind -name"
  alias rm_dsstore="find . -name .DS_Store -delete"

  iscmd mvim && alias gvim="mvim"
  iscmd brew && alias brewup="brew update && brew upgrade && brew cleanup"
;;

freebsd*)
  alias -g ls="ls -FIG"
  alias portupdate="sudo portsnap fetch update"
  alias pkgi="sudo -E pkg_add -r" 
  alias pkga="sudo -E pkg_add -r" 
  alias pkgr="sudo -E pkg_delete" 
  alias pkgd="sudo -E pkg_delete" 
;;

openbsd*)
  alias pkgi="sudo -E pkg_add -r" 
  alias pkga="sudo -E pkg_add -r" 
  alias pkgr="sudo -E pkg_delete" 
  alias pkgd="sudo -E pkg_delete" 
  alias cvsupd="sudo cvsup -g -L 2 /etc/cvsupfile"
  alias out-of-date="sudo /usr/ports/infrastructure/build/out-of-date"
  alias compile-system="sudo rm -rf /usr/obj/* && cd /usr/src && sudo make obj && cd /usr/src/etc && env DESTDIR=/ sudo make distrib-dirs && cd /usr/src && sudo make build && echo completed!"
  alias compile-kernel="cd /usr/src/sys/arch/i386/conf/ && sudo config GENERIC && cd ../compile/GENERIC && sudo make clean && sudo make depend && sudo make && sudo make install && echo completed!"
  if which colorls &>/dev/null; then 
    alias ls="colorls -GF"
  fi
  alias pf="sudo -E pfctl"
  alias rpf="sudo -E pfctl -f /etc/pf.conf"
  alias epf="sudo -E $EDITOR /etc/pf.conf"
;;

solaris*)
  alias ls="ls --color=auto"
;;
esac

## universal aliases
alias e=$EDITOR
alias ge=gvim

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

alias -g dun='du -amx . | sort -n'

alias ...='cd ../..'
alias ....='cd ../../..'

if iscmd rsync; then
  alias -g cpr='rsync -avh --progress'
  alias -g mvr='rsync -avh --remove-source-files --progress'
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
  alias "@"="ssh"
  alias s-vnc="ssh -L5901:localhost:5900 "
fi

if iscmd wget; then
  alias -g wget="wget --trust-server-names"
fi

# rlwrap from oracletoolkit
if iscmd rlwrap; then
  CONF="/opt/oracle/otk/current/conf/"
  alias rman='touch $CONF/rlwrap/rman.key; rlwrap -i -f $CONF/rlwrap/rman.key rman'
  alias sqlplus='touch $CONF/rlwrap/oracle.key; rlwrap -i -f $CONF/rlwrap/oracle.key sqlplus'
fi
