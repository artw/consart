# load zplug if available
local zplug=~/.zplug/init.zsh
if [[ -f $zplug ]]; then

  zsh_plugins=(
    #artw/oracle.zsh
    # chrissicool/zsh-256color
    # sharat87/zsh-vim-mode
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting

  )
  oh_my_zsh_plugins=(
    1password
    sudo
  )

  source $zplug
  foreach plugin in $oh_my_zsh_plugins
    zplug "plugins/$plugin", from:oh-my-zsh
  end
  foreach bundle in $zsh_plugins
    zplug "$bundle"
  end

  # Plugins with custom settings
  #zplug "clvv/fasd", use:fasd
  zplug "agkozak/zsh-z"
  #zplug "gcuisinier/jenv", as:command, use:"bin/jenv"
  #zplug "harelba/q", as:command, use:"bin/q"
  #zplug "rbenv/rbenv", as:command, use:"bin/rbenv"
  #zplug "junegunn/fzf", as:command, use:"{bin/fzf-tmux,fzf}"
  zplug romkatv/powerlevel10k, as:theme, depth:1
  # zplug self manage
  zplug 'zplug/zplug', hook-build:'zplug --self-manage'

  # Install plugins if there are plugins that have not been installed
  # if ! zplug check --verbose; then
  #     printf "Install? [y/N]: "
  #     if read -q; then
  #         echo; zplug install
  #     fi
  # fi
  # load zplug
  zplug load

  # bind up/down to substring search if zsh-substring-search is installed
  if [[ -d $ZPLUG_REPOS/zsh-users/zsh-history-substring-search ]]; then
    zle -N history-substring-search-up
    zle -N history-substring-search-down
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
  fi
  #iscmd fasd && eval "$(fasd --init auto)"
  #iscmd rbenv && eval "$(rbenv init -)"
  #iscmd fzf && source $ZPLUG_REPOS/junegunn/fzf/shell/*.zsh
fi

# load perlbrew if installed
if [ -f $HOME/.perlbrew/etc/bashrc ]; then
  function perlbrew() { 
    sourceiff $HOME/.perlbrew/etc/bashrc
    perlbrew "$@"
  }
fi

iscmd jenv && eval "$(jenv init -)"
iscmd thefuck && eval "$(thefuck --alias)"

# load  pkgfile command-not-find addon if installed
sourceiff /usr/share/doc/pkgfile/command-not-found.zsh

# Go language
iscmd go && export GOPATH=~/.go; export PATH=$PATH:$GOPATH/bin

# p10k theme
iscmd p10k && source ~/.zsh/p10k.zsh

## installers for plugins

# perlbrew, perl installation management tool
function install_perlbrew {
  if [[ -d $HOME/.perlbrew ]]; then
    echo "~/.perlbrew already exists, trying to update instead"
    perlbrew self-upgrade
    return
  fi
  export PERLBREW_ROOT=$HOME/.perlbrew
  curl -L http://install.perlbrew.pl | sh
}

# vim-plug, plugin manager for vim
function install_vimplug {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# zplug, plugin manager for zsh
function install_zplug {
  git-clone zplug/zplug ~/.zplug
}

# tmux plugin manager
function install_tpm {
  git-clone tmux-plugins/tpm ~/.tmux/plugins/tpm 
  local runline="run '~/.tmux/plugins/tpm/tpm'"
  local conf="$HOME/.tmux.conf"
  grep $runline $conf &> /dev/null || echo $runline >> $conf
}
