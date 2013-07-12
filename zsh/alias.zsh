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
    alias apt-get="${sudo}apt-get"
  fi
  # redhat
  if iscmd yum; then
    alias yum="${sudo}yum" 
    alias rpm="${sudo}rpm"
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
  alias finder="open -a Finder"
  alias run="open -a"
  alias locate="mdfind -name"
  alias rm_dsstore="find . -name .DS_Store -delete"

  iscmd htop && alias htop="${sudo}sudo htop"
  iscmd mvim && alias gvim="mvim"
  iscmd brew && alias brewup="brew update && brew upgrade && brew cleanup"
;;

freebsd*)
  alias ls=" ls -FIG"
  alias port-up="gitup /usr/ports"
  alias src-up="gitup /usr/src"
  alias src-build="cd /usr/src && ${sudo}make clean && ${sudo} make cleanworld && ${sudo} make buildworld && ${sudo} make buildkernel"
  
;;

openbsd*)
  iscmd colorls && alias ls=" colorls -GF"
;;

solaris*)
  alias ls=" ls --color=auto"
;;
esac

## universal aliases

alias today='date +%d-%m-%Y'

if [[ ! -z $EDITOR ]]; then
  alias e=$EDITOR
  alias _e=${sudo}$EDITOR
fi

iscmd gvim && alias ge=gvim

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
alias -g S='| sort -n'

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
alias d='dirs -v'

if iscmd tmux; then
  alias tx="tmux attach || tmux new"
  alias tmux-b="tmux set-option -g prefix C-b"
  alias tmux-a="tmux set-option -g prefix C-a"
fi

if iscmd hg; then
  alias hgu="hg pull -u"
  alias cup="cd ~/.consart && hgu && cd - > /dev/null"
fi

if iscmd ssh; then
  alias -g "@"="ssh"
  alias @vnc="ssh -L5901:localhost:5900 "
fi

if iscmd zpool && iscmd zfs; then
  alias zpool="${sudo}zpool"
  alias zfs="${sudo}zfs"
fi

# fix mouseable apps in screen/tmux
if [[ $TERM == screen-256color ]]; then
  iscmd mc && alias mc="TERM=xterm-256color mc"
fi

if [[ $TERM == xterm-256color || $TERM == screen* ]]; then
  # F keys are broken when 256color, and mouse does not work in screen 
  iscmd htop && alias htop="TERM=xterm htop"
fi
