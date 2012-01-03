# system speciefic aliases:
case $OSTYPE in 
   linux*)
      alias grep="grep --color=auto"
      alias ls="ls --color=auto -F"
      # arch
      alias ya="yaourt"
      alias yau="yaourt -Syu --devel --aur"
      # gentoo
      alias em="sudo emerge"
      alias emc="sudo emerge"
      alias esync="sudo eix-sync"
      alias udav="sudo emerge -uDavN world"
      # debian
      alias apt="sudo apt-get"
      alias apti="sudo apt-get install"
      alias aptr="sudo apt-get remove"
      alias aptu="sudo apt-get update"
      alias apts="sudo apt-cache search"
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
alias rezsh="rehash && source $HOME/.zshrc"
alias sudo="sudo -E"

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir'

alias l='ls -l'
alias la='ls -la'
alias lah='ls -lah'

alias dun='du -akx . | sort -n'

alias ...='cd ../..'
alias ....='cd ../../..'

alias cpr='rsync -avh --progress'
alias mvr='rsync -avh --remove-source-files --progress'
alias _cpr='sudo rsync -avh --progress'
alias _mvr='sudo rsync -avh --remove-source-files --progress'

alias '#'='sudo'
alias '£'='sudo'
alias '_'='sudo'
alias '_e'='sudo vim'
alias 'e'='vim'

alias h='fc -l 1'
alias hs='fc -l 1 | grep '

alias dr='dirs -v'

alias rcconf="sudo vim /etc/rc.conf"

alias svc="sudo service"
alias tx="tmux -2 attach || tmux -2 new"
alias tmux-b="tmux set-option -g prefix C-b"
alias tmux-a="tmux set-option -g prefix C-a"

alias hgu="hg pull -u"

alias ssh-vnc="ssh -L5901:localhost:5900 "
alias ssh-transmission="ssh -L9092:localhost:9091 "

alias wget="wget --trust-server-names"

