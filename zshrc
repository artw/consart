for file in $HOME/.zsh/*.zsh; do
        source $file
done;
if [[ -f $HOME/.zshrc2 ]]; then
   source $HOME/.zshrc2
fi
