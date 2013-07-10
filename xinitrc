# for QT GTK+ theme
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

# for JDK and other
if which wmname &>/dev/null; then
  wmname LG3D
fi

if which xxkb &>/dev/null; then
  xxkb
fi
exec i3
