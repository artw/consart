# load zgen if available
if [[ -f ~/.zsh/ext/zgen/zgen.zsh ]]; then
  typeset -a zsh_plugins
  zsh_plugins=(
    #artw/oracle.zsh
    Vifon/deer
    chrissicool/zsh-256color
    rupa/z
    sharat87/zsh-vim-mode
    zsh-users/zsh-completions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh/syntax-highlighting
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

  # load deer and bind it to alt+k
  if [[ -d ~/.zgen/repos/Vifon/deer-master ]]; then
    source ~/.zgen/repos/Vifon/deer-master/deer
    zle -N deer-launch
    bindkey '\ek' deer-launch
    typeset -Ag DEER_KEYS
    DEER_KEYS[down]=j
    DEER_KEYS[page_down]=J
    DEER_KEYS[up]=k
    DEER_KEYS[page_up]=K
    DEER_KEYS[enter]=l
    DEER_KEYS[leave]=h
    DEER_KEYS[search]=/
    DEER_KEYS[filter]=f
    DEER_KEYS[toggle_hidden]=H
    DEER_KEYS[quit]=q
    DEER_KEYS[append_path]=a
    DEER_KEYS[append_abs_path]=A
    DEER_KEYS[insert_path]=i
    DEER_KEYS[insert_abs_path]=I
    DEER_KEYS[multi_insert_dwim]=s
    DEER_KEYS[chdir]=c
    DEER_KEYS[chdir_selected]=C
    DEER_KEYS[rifle]=r
  fi
fi

# load rbenv if available
if [[ -d $HOME/.rbenv ]];then 
  export PATH=$HOME/.rbenv/bin:$PATH
  eval "$(rbenv init -)"
fi

# load perlbrew if installed
if [[ -f $HOME/.perlbrew/etc/bashrc ]]; then
  export PERLBREW_ROOT=$HOME/.perlbrew
  source $PERLBREW_ROOT/etc/bashrc
fi

## installers for plugins
# rbenv, cleaner RVM alternative
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
  export PERLBREW_ROOT=$HOME/.perlbrew
  curl -L http://install.perlbrew.pl | sh
}

function install_vundle {
  git-clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
}

function install_zgen {
 git-clone https://github.com/tarjoilija/zgen ~/.zsh/ext/zgen
}
