# system speciefic aliases:
case $OSTYPE in 
linux*)
  alias grep="grep --color=auto"
  alias ls="ls --color=auto -F"
  # arch
  if which yaourt &>/dev/null; then
    alias ya="yaourt"
    alias yau="yaourt -Syu --devel --aur"
  fi
  # gentoo
  if which emerge &>/dev/null; then
    alias em="sudo emerge"
    alias emc="sudo emerge"
    alias esync="sudo eix-sync"
    alias udav="sudo emerge -uDavN world"
  fi  
  # debian
  if which apt-get &>/dev/null; then
    alias apt="sudo apt-get"
    alias apti="sudo apt-get install"
    alias aptr="sudo apt-get remove"
    alias aptu="sudo apt-get update"
    alias aptup="sudo apt-get upgrade"
    alias apts="sudo apt-cache search"
  fi
;;

cygwin)
  alias ls="ls --color=auto -F"
  alias ping="nocorrect ping"
;;

darwin*) 
  alias grep="grep --color=auto"
  alias ls="ls -GF"
  alias eject="diskutil eject"
  alias port="sudo port -v"
  alias portup="sudo port -v selfupdate && sudo port -v upgrade outdated ; sudo port uninstall inactive"
  alias finder="open -a Finder"
  alias refinder="killall Finder && open -a TotalFinder"
  alias run="open -a"
  alias locate="mdfind -name"
  alias rm_dsstore="find . -name .DS_Store -delete"
  if which mvim &>/dev/null; then
    alias gvim="mvim"
  fi
;;

freebsd*)
  alias ls="ls -FIG"
  alias pkga="sudo -E pkg_add -r" 
  alias portupdate="sudo portsnap fetch update"
;;

openbsd*)
  alias cvsupd="sudo cvsup -g -L 2 /etc/cvsupfile"
  alias out-of-date="sudo /usr/ports/infrastructure/build/out-of-date"
  alias compile-system="sudo rm -rf /usr/obj/* && cd /usr/src && sudo make obj && cd /usr/src/etc && env DESTDIR=/ sudo make distrib-dirs && cd /usr/src && sudo make build && echo completed!"
  alias compile-kernel="cd /usr/src/sys/arch/i386/conf/ && sudo config GENERIC && cd ../compile/GENERIC && sudo make clean && sudo make depend && sudo make && sudo make install && echo completed!"
  alias ls="colorls -GF"
  alias pf="sudo -E pfctl"
  alias rpf="sudo -E pfctl -f /etc/pf.conf"
  alias epf="sudo -E $EDITOR /etc/pf.conf"
;;
esac

## universal aliases

if which sudo &>/dev/null; then
  alias sudo="sudo -E"
  alias '#'='sudo'
  alias '£'='sudo'
  alias '_'='sudo'
  alias '_e'='sudo $EDITOR'
  alias '_ge'='sudo gvim'
  alias rcconf="sudo vim /etc/rc.conf"
  alias svc="sudo service"
fi

alias rezsh="rehash && source $HOME/.zshrc"

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir'

alias l='ls -l'
alias la='ls -la'
alias lah='ls -lah'

alias dun='du -akx . | sort -n'

alias ...='cd ../..'
alias ....='cd ../../..'

if which rsync &>/dev/null; then
  alias cpr='rsync -avh --progress'
  alias mvr='rsync -avh --remove-source-files --progress'
  alias _cpr='sudo rsync -avh --progress'
  alias _mvr='sudo rsync -avh --remove-source-files --progress'
fi

alias e='vim'

alias h='fc -l 1'
alias hs='fc -l 1 | grep '
alias dr='dirs -v'

if which tmux &>/dev/null; then
  alias tx="tmux -2 attach || tmux -2 new"
  alias tmux-b="tmux set-option -g prefix C-b"
  alias tmux-a="tmux set-option -g prefix C-a"
fi

if which hg &>/dev/null; then
  alias hgu="hg pull -u"
  alias cup="cd ~/.consart && hgu && cd -"
fi

alias s-vnc="ssh -L5901:localhost:5900 "
alias s-transmission="ssh -L9092:localhost:9091 "

if which wget &>/dev/null; then
  alias wget="wget --trust-server-names"
fi

if which puppet &>/dev/null; then
  alias pupp1="puppet agent --verbose --no-daemonize --onetime"
fi

# rlwrap from oracletoolkit
if which rlwrap &>/dev/null; then
  CONF="/opt/oracle/otk/current/conf/"
  alias rman='touch $CONF/rlwrap/rman.key; rlwrap -i -f $CONF/rlwrap/rman.key rman'
  alias sqlplus='touch $CONF/rlwrap/oracle.key; rlwrap -i -f $CONF/rlwrap/oracle.key sqlplus'
fi
