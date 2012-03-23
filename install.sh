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
  echo `dirname $f`
end



