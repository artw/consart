# use sudo in some commands unless root
iamuser && iscmd sudo && sudo="nocorrect sudo "

# system speciefic aliases
case $OSTYPE in 
linux*)
  alias grep="grep --color=auto"
  alias ls=" ls --color=auto -F"
  iscmd grub-mkconfig && alias -g grub2-cfg="${sudo}grub-mkconfig -o /boot/grub/grub.cfg"
  # arch
  if iscmd yaourt; then
    alias ya="yaourt"
    alias yau="yaourt -Syubb --devel --aur"
  fi
  # gentoo
  if iscmd emerge; then
    alias em="${sudo}emerge"
    alias udav="${sudo}emerge -uDavN world"
  fi  
  # debian
  if iscmd apt-get; then
    alias apt="${sudo}apt-get"
    alias aptu="${sudo}apt-get update"
    alias aptup="${sudo}apt-get upgrade"
    alias apti="${sudo}apt-get install"
    alias aptc="${sudo}apt-cache"
  fi
  # redhat
  if iscmd yum; then
    alias yum="${sudo}yum" 
    alias yumu="${sudo}yum update" 
    alias yumup="${sudo}yum upgrade"
    alias yumi="${sudo}yum install"
    alias rpm="${sudo}rpm"
    alias rpmi="${sudo}rpm -Uvh"
  fi

  # MIPS device with optware (f.e. router)
  if [[ $(uname -m) -eq 'mips' ]]; then
    iscmd hg-py2.7 && alias -g hg="hg-py2.7"
  fi
;;

cygwin)
  alias ls=" ls --color=auto -F"
  alias ping="nocorrect /cygdrive/c/windows/system32/ping.exe"
;;

darwin*) 
  alias grep="grep --color=auto"
  alias ls=" ls -GF"
  alias eject="diskutil eject"
  alias finder="open -a Finder"
  alias refinder="killall Finder && open -a TotalFinder"
  alias run="open -a"
  alias locate="mdfind -name"
  alias rm_dsstore="find . -name .DS_Store -delete"

  iscmd htop && alias htop="${sudo}sudo htop"
  iscmd mvim && alias gvim="mvim"
  iscmd brew && alias brewup="brew update && brew upgrade && brew cleanup"
;;

freebsd*)
  alias ls=" ls -FIG"
  alias portup="${sudo}portsnap fetch update"
;;

openbsd*)
  iscmd colorls && alias ls=" colorls -GF"
  alias pf="${sudo}pfctl"
  alias rpf="${sudo}pfctl -f /etc/pf.conf"
  alias epf="${sudo}$EDITOR /etc/pf.conf"
;;

solaris*)
  alias ls=" ls --color=auto"
;;
esac

# aliases for directory stack (from oh-my-zsh)
alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

## universal aliases
alias e=$EDITOR
alias _e='sudoedit'
alias ge=gvim

if iscmd sudo; then
  alias sudo="nocorrect sudo -E"
  alias '#'='sudo'
  alias '£'='sudo'
fi

alias rezsh="rehash && source $HOME/.zshrc"

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir'

alias l=' ls -l'
alias la=' ls -la'
alias lah=' ls -lah'

alias -g L='| less'
alias -g G='| grep'
alias -g GV='| grep -v'
alias -g N='| sort -n'

alias -g dun='du -kax'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../..'

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

if iscmd zpool && iscmd zfs; then
  alias zpool="${sudo}zpool"
  alias zfs="${sudo}zfs"
fi

# mouse in mc running in screen/tmux
if iscmd mc; then
  if [[ $TERM == screen* ]]; then
    alias mc="TERM=xterm COLORTERM=rxvt mc"
  fi
fi
