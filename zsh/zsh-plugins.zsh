# load antigen if available
if [[ -f ~/.zsh/external/antigen/antigen.zsh ]]; then
  source ~/.zsh/external/antigen/antigen.zsh
  # antigen bundles
  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-history-substring-search
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle rupa/z
fi

# bind up/down j/k to substring search if zsh-substring-search is installed
if [[ -f ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-zsh-users-SLASH-zsh-history-substring-search.git/zsh-history-substring-search.plugin.zsh ]]; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
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

function install_antigen {
 git-clone https://github.com/zsh-users/antigen ~/.zsh/external/antigen
}
