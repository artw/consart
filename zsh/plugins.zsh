# antidote - plugin manager
# prefer the self-managed copy (updated via antidote update), fall back to bootstrap
local _antidote_sh
for _antidote_sh in \
  ${ANTIDOTE_HOME}/github.com/mattmc3/antidote/antidote.zsh \
  ~/.antidote/antidote.zsh; do
  [[ -f $_antidote_sh ]] && { source $_antidote_sh; break }
done
unset _antidote_sh

# load plugins — bundle file lives in dotfiles (~/.zsh/), static file in $HOME
if (( $+functions[antidote] )); then
  local _bundle=~/.zsh/zsh_plugins.txt
  local _static=${ANTIDOTE_HOME}/zsh_plugins.zsh
  if [[ ! -f $_static || $_bundle -nt $_static ]]; then
    antidote bundle <$_bundle >$_static
  fi
  source $_static
fi

# z + fzf integration
if iscmd fzf; then
  unalias z 2>/dev/null
  function z {
    local dir=$(awk -F'|' '{print $1}' ${_Z_DATA:-$HOME/.z} | fzf --tac -q "$*")
    [[ -n $dir ]] && cd "$dir"
  }
fi

# atuin - frecency-powered shell history
iscmd atuin && eval "$(atuin init zsh --disable-up-arrow)"

# lazy inits (only run if tool is installed; must affect current shell, no &)
iscmd jenv && eval "$(jenv init -)"
iscmd thefuck && eval "$(thefuck --alias)"

# perlbrew - lazy load on first use
if [[ -f $HOME/.perlbrew/etc/bashrc ]]; then
  function perlbrew() {
    sourceiff $HOME/.perlbrew/etc/bashrc
    perlbrew "$@"
  }
fi

# pkgfile command-not-found handler (arch linux)
sourceiff /usr/share/doc/pkgfile/command-not-found.zsh

# Go
if iscmd go; then
  export GOPATH=~/.go
  export PATH=$PATH:$GOPATH/bin
fi

## installers

function install_perlbrew {
  if [[ -d $HOME/.perlbrew ]]; then
    echo "~/.perlbrew already exists, trying to update instead"
    perlbrew self-upgrade
    return
  fi
  export PERLBREW_ROOT=$HOME/.perlbrew
  curl -L http://install.perlbrew.pl | sh
}

function install_vimplug {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_antidote {
  if [[ -d ~/.antidote ]]; then
    echo "~/.antidote already exists — run 'antidote update' to update"
    return
  fi
  git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
  echo "antidote installed — restart shell or run: source ~/.antidote/antidote.zsh && antidote load"
}

function install_tpm {
  git-clone tmux-plugins/tpm ~/.tmux/plugins/tpm
  local runline="run '~/.tmux/plugins/tpm/tpm'"
  local conf="$HOME/.tmux.conf"
  grep $runline $conf &> /dev/null || echo $runline >> $conf
}
