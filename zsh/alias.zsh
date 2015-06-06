## use sudo in some commands unless root
iamuser && iscmd sudo && sudo="sudo "

## system specific aliases
case $OSTYPE in
linux*)
  alias grep="grep --color=auto"
  alias ls="ls --color=auto -F"
  iscmd grub-mkconfig && alias grub-cfg="${sudo}grub-mkconfig -o /boot/grub/grub.cfg"
  # arch
  if iscmd pacman; then
    alias pm="${sudo}pacman"
    if iscmd yaourt; then
      alias ya="yaourt"
    fi
  fi
  # gentoo
  if iscmd emerge; then
    alias em="${sudo}emerge -qav"
    alias udav="${sudo}emerge -quDavN world"
  fi
  # debian
  if iscmd apt-get; then
    alias apt="${sudo}apt-get"
    alias apt-get="${sudo}apt-get"
  fi
  # redhat
  iscmd yum && alias yum="${sudo}yum"
  iscmd rpm && alias rpm="${sudo}rpm"

  # suse
  iscmd zypper && alias zyp="${sudo}zypper"

  # MIPS device with optware (router)
  if [[ $(uname -m) -eq 'mips' ]]; then
    iscmd hg-py2.7 && alias -g hg="hg-py2.7"
    unalias grep # busybox grep is monochrome
  fi

  if iscmd systemctl; then
    alias sc="${sudo}systemctl"
    alias zzz="${sudo}systemctl suspend"
    alias halt="${sudo}systemctl poweroff"
  fi
;;

cygwin|msys)
  alias ls=" ls --color=auto -F"
;;

darwin*)
  alias rm_dsstore="find . -name .DS_Store -delete"
  if [[ $(uname -p) == arm ]]; then
    alias ls="ls --color=auto"
  else
    alias grep="grep --color=auto"
    alias ls="ls -GF"
    alias finder="open -a Finder"
    alias run="open -a"
    alias sl="mdfind -name"

    iscmd htop && alias htop="${sudo}htop"
    if iscmd brew; then
      alias brew-up="brew update && brew upgrade --all && brew cleanup"
      alias brewc="brew cask"
    fi

    alias zzz="pmset sleepnow"
    alias -g "±"=$HOME
    alias "£"="sudo"
    if [[ -x "/Applications/VLC.app/Contents/MacOS/VLC" ]]; then
      alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"
    elif [[ -x "$HOME/Applications/VLC.app/Contents/MacOS/VLC" ]]; then
      alias vlc="$HOME/Applications/VLC.app/Contents/MacOS/VLC"
    fi
    iscmd mvim && alias ge=mvim
  fi
;;

freebsd*)
  iscmd portmaster && alias portmaster="${sudo}portmaster"
  iscmd poudriere && alias poudriere="${sudo}poudriere"
  alias pkg="${sudo}pkg"
  alias port-up="git-up /usr/ports"
  alias src-up="git-up /usr/src"
  iscmd fdisk-linux && alias fdisk="${sudo}fdisk-linux"
  alias jail="${sudo}jail"
  alias jexec="${sudo}jexec"
  alias jstart="${sudo}jail -c"
  alias jstop="${sudo}jail -r"
  alias jpkg="${sudo}pkg -j"
  alias jpkg-upgrade="xargs -I % ${sudo}pkg -j % upgrade -y"
  alias jpkg-upgrade-all="jls -N | tail -n +2 | cut -f2 -d' ' | xargs -I % ${sudo}pkg -j % upgrade -y"
  iscmd gnu-watch && alias watch="gnu-watch"
  if iscmd drill && ! iscmd dig; then
    alias dig=drill
    alias nslookup=host
  fi
  alias sc="${sudo}service"
;;

openbsd*)
  iscmd colorls && alias ls="colorls -GF"
;;

solaris*)
  alias ls="ls --color=auto"
;;
esac

## universal aliases
# do not correct some commands
alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir'
alias man='nocorrect man'

# "shortcuts" for most used commands
alias c='cat'
alias cls='clear'
alias d='dirs -v'
alias g='grep'
alias h='fc -l 1'
alias hs='fc -l 1 | grep'
alias j='jobs'
alias l='ls'
alias md='mkdir'
alias t='touch'

# ls, cd, etc...
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../..'

alias -g dua='du -kax'

# editor
if [[ ! -z $EDITOR ]]; then
  alias e="TERM=xterm-256color $EDITOR"
  alias E="TERM=xterm-256color sudo -E $EDITOR"
  alias _e="TERM=xterm-256color sudo -E $EDITOR"
fi
iscmd gvim && alias ge=gvim

# sudo
if iscmd sudo; then
  alias sudo="nocorrect sudo"
  alias -g '#'='sudo'
  alias -g '##'='sudo !$'
fi

# plumbing
alias -g _='| sudo'
alias -g L='| less'
alias -g G='| grep'
alias -g Gv='| grep -v'
alias -g S='| sort -n'

# function like
alias today='date +%Y-%m-%d'

# X
iscmd feh && alias feh-bg="feh --bg-scale ~/.wallpaper"
iscmd startx && alias startx="cd ~ && startx"
if iscmd xclip; then
  alias xclipc="xclip -selection clipboard"
  alias xclips="xclip -selection secondary"
fi
iscmd xdg-open && alias open="xdg-open"
iscmd qdbus && alias kde-logout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"

# misc software
if iscmd rsync; then
  alias -g cpr='rsync -avhP'
  alias -g mvr='rsync -avhP --remove-source-files'
fi

if iscmd tmux; then
  alias tx="tmux attach -c ~ || tmux new -c ~"
  alias txl="tmux list-sessions"
  alias txa="tmux attach -c ~ -t"
  alias txc="tmux new-session -c ~ -s"
fi

if iscmd hg; then
  alias hgu="hg pull -u"
  alias hgc="hg commit"
  alias hgp="hg push"
fi

if iscmd ssh; then
  alias -g "@"="ssh"
  alias @x="ssh -CYf "
  alias @t="ssh -Nf "
  alias @c="ssh -t "
fi

if iscmd zpool && iscmd zfs; then
  alias zpool="${sudo}zpool"
  alias zfs="${sudo}zfs"
fi

iscmd gdisk && alias gdisk="${sudo}gdisk"

if iscmd dropbox-cli; then
  alias dropbox="dropbox-cli"
fi

# fix mouseable apps in screen/tmux
if [[ $TERM == screen-256color ]]; then
  iscmd mc && alias mc="TERM=xterm-256color mc"
elif [[ $TERM == screen ]]; then
  iscmd mc && alias mc="TERM=xterm mc"
fi

if [[ $TERM == xterm-256color || $TERM == screen* ]]; then
  # F keys are broken when 256color, and mouse does not work in screen
  iscmd htop && alias htop="TERM=xterm htop"
fi

# consart
alias rezsh="rehash && source $HOME/.zshrc"
alias cup="cd ~/.consart && hgu"
