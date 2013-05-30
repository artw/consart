BUNDLE=$HOME/.vim/bundle
rm -rf $BUNDLE/*

git clone git://github.com/tpope/vim-surround.git $BUNDLE/surround
git clone git://github.com/scrooloose/nerdcommenter.git $BUNDLE/nerdcommenter
git clone git://github.com/scrooloose/nerdtree.git $BUNDLE/nerdtree

curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
