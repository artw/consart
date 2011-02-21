# system speciefic aliases:
case $OS in 
   linux)
      alias ls='ls --color=auto -F'
      ;;

   macos) 
      alias ls="ls -GF"
      alias finder="open /System/Library/CoreServices/Finder.app"
      alias locate="mdfind"
      ;;

   freebsd)
      alias ls="ls -GF"
      alias pkga="sudo -E pkg_add -r" 
      ;;

   openbsd)
      alias cvsupd="sudo cvsup -g -L 2 /etc/cvsupfile"
      alias out-of-date="sudo /usr/ports/infrastructure/build/out-of-date"
      alias compile-system="sudo rm -rf /usr/obj/* && cd /usr/src && sudo make obj && cd /usr/src/etc && env DESTDIR=/ sudo make distrib-dirs && cd /usr/src && sudo make build && echo completed!"
      alias compile-kernel="cd /usr/src/sys/arch/i386/conf/ && sudo config GENERIC && cd ../compile/GENERIC && sudo make clean && sudo make depend && sudo make && sudo make install && echo completed!"
      alias ls="colorls -GF"
      alias pf="sudo pfctl"
      alias rpf="sudo pfctl -f /etc/pf.conf"
      alias epf="sudo $EDITOR /etc/pf.conf"
      ;;
esac


alias ya="sudo yaourt"


alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias rcp='rsync -avh --progress'
alias rmv='rsync -avh --remove-source-files --progress'
alias mkdir='nocorrect mkdir'
alias l='ls -l'
alias la='ls -la'

alias ...='cd ../..'
alias ....='cd ../../..'

alias sudo='sudo -E'
alias '#'='sudo -E'
alias '£'='sudo -E'
alias '_e'='sudo -eE'
alias h='fc -l 1'

alias rcconf="sudo $EDITOR /etc/rc.conf"
