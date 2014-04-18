# load external plugins if available
local -a zsh_plugins
zsh_plugins=(
  $HOME/.zsh/external/z/z.sh
  $HOME/.zsh/external/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
)

foreach script in $zsh_plugins
  test -f $script && source $script
end

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

# z, advanced wd history
function install_z {
  git-clone https://github.com/rupa/z.git ~/.zsh/external/z
}

# fish like zsh syntax highlighter 
function install_zsh-syntax-highlighting {
  git-clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/external/zsh-syntax-highlighting
}

# perlbrew, perl installation management tool
function install_perlbrew {
  export PERLBREW_ROOT=$HOME/.perlbrew
  curl -L http://install.perlbrew.pl | sh
}
