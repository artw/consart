#!/usr/bin/env zsh
configs=(
  zsh
  zshrc
  vimrc
  vim
  tmux.conf
  hgrc
  Xdefaults
)
foreach f in $configs
  rm -rf ${HOME}/.$f
  ln -s ./$f(:a) ${HOME}/.$f
end



