# system speciefic aliases:
case $(uname) in 
   Linux)
      alias ls='ls --color=auto -F'
      ;;

   Darwin) 
      alias ls="ls -GF"
      alias finder="open /System/Library/CoreServices/Finder.app"
      alias eject="hdiutil eject"
      alias port="sudo port"
      alias portup="sudo port -v selfupdate"
      alias portupg="sudo port -v upgrade outdated && sudo port uninstall inactive"
      ;;

   FreeBSD)
      alias ls="ls -GF"
      alias pkga="sudo -E pkg_add -r" 
      alias portupdate="sudo portsnap fetch update"
      ;;

   OpenBSD)
      alias cvsupd="sudo cvsup -g -L 2 /etc/cvsupfile"
      alias out-of-date="sudo /usr/ports/infrastructure/build/out-of-date"
      alias compile-system="sudo rm -rf /usr/obj/* && cd /usr/src && sudo make obj && cd /usr/src/etc && env DESTDIR=/ sudo make distrib-dirs && cd /usr/src && sudo make build && echo completed!"
      alias compile-kernel="cd /usr/src/sys/arch/i386/conf/ && sudo config GENERIC && cd ../compile/GENERIC && sudo make clean && sudo make depend && sudo make && sudo make install && echo completed!"
      alias ls="colorls -GF"
      alias pf="sudo -E pfctl"
      alias rpf="sudo -E pfctl -f /etc/pf.conf"
      alias epf="sudo -E vim /etc/pf.conf"
      ;;
esac

alias xlock="xscreensaver-command -lock"
alias rezsh="rehash && source $HOME/.zshrc"
alias ya="sudo yaourt"
alias sudo="sudo -E"

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'

alias mkdir='nocorrect mkdir'
alias l='ls -l'
alias la='ls -la'

alias ...='cd ../..'
alias ....='cd ../../..'

alias rcp='rsync -avh --progress'
alias rmv='rsync -avh --remove-source-files --progress'
alias _rcp='sudo rsync -avh --progress'
alias _rmv='sudo rsync -avh --remove-source-files --progress'

alias '#'='sudo'
alias '£'='sudo'
alias '_'='sudo'
alias '_e'='sudo vim'
alias 'e'='vim'

alias h='fc -l 1'
alias hs='fc -l 1 | grep '

alias rcconf="sudo vim /etc/rc.conf"

alias svc="sudo service"
alias tx="tmux -2"
alias tmux-b="tmux set-option -g prefix C-b"
alias tmux-a="tmux set-option -g prefix C-a"

alias hgu="hg pull -u"

alias svnc="ssh -L5901:localhost:5900 "
