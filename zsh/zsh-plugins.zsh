# load zgen if available
if [[ -f ~/.zsh/ext/zgen/zgen.zsh ]]; then
  typeset -a zsh_plugins
  zsh_plugins=(
    #artw/oracle.zsh
    artw/zsh-256color
    rupa/z
    sharat87/zsh-vim-mode
    zsh-users/zsh-completions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
  )
  source ~/.zsh/ext/zgen/zgen.zsh
  if ! zgen saved; then
    echo "Generating zgen cache..."
    foreach bundle in $zsh_plugins
      zgen load $bundle
    end
  zgen save
  fi
  # bind up/down to substring search if zsh-substring-search is installed
  if [[ -d ~/.zgen/zsh-users/zsh-history-substring-search-master ]]; then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
  fi
fi

# load rbenv if installed
if [[ -d $HOME/.rbenv ]]; then
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

# load perlbrew if installed
if [[ -f $HOME/.perlbrew/etc/bashrc ]]; then
  source $HOME/.perlbrew/etc/bashrc
fi

# load jenv if installed
if [[ -x $HOME/.jenv/bin/jenv ]]; then
  export PATH=$HOME/.jenv/bin:$PATH
  eval "$(jenv init -)"
fi

# load fzf if installed
if [[ -x ~/.fzf/fzf ]]; then
  source $HOME/.fzf/shell/completion.zsh
  source $HOME/.fzf/shell/key-bindings.zsh
fi

## installers for plugins
# rbenv, ruby installation management tool
function install_rbenv {
  git-clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git-clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
}

# q, "text as data", work with text using sql (requires python)
function install_q {
  if [[ -x ~/.bin/q ]]; then
    echo "q is already at ~/.bin/q"
    return 1
  else
    mkdir -p ~/.bin &&
    curl https://cdn.rawgit.com/harelba/q/1.5.0/bin/q\?source=install_page 1> ~/.bin/q 2>/dev/null &&
    chmod +x ~/.bin/q
    echo "q installed to ~/.bin/q"
  fi
}

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

# vundle, plugin manager for vim
function install_vundle {
  git-clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
}

# zsh, fast plugin manager for zsh
function install_zgen {
  git-clone https://github.com/tarjoilija/zgen ~/.zsh/ext/zgen
}

# jenv, java installation management tool
function install_jenv {
  git-clone https://github.com/gcuisinier/jenv.git ~/.jenv
}

# fzf, fuzzy finder written in go
function install_fzf {
  git-clone https://github.com/junegunn/fzf ~/.fzf
  mkdir -p ~/.bin
  ln -sf ~/.fzf/fzf ~/.bin/fzf
  ln -sf ~/.fzf/bin/fzf-tmux ~/.bin/fzf-tmux
}

# tmux plugin manager
function install_tpm {
  git-clone tmux-plugins/tpm ~/.tmux/plugins/tpm 
  local runline="run '~/.tmux/plugins/tpm/tpm'"
  local conf="$HOME/.tmux.conf"
  grep $runline $conf &> /dev/null || echo $runline >> $conf
}
