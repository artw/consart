# for QT GTK+ theme
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

# to fix JDK and other
if which wmname &>/dev/null; then
  wmname LG3D
fi

# set keyboard layouts
if which setxkbmap &>/dev/null; then
  setxkbmap -layout "lv, ru" -option "grp:caps_toggle" 
fi

# keyboard layout switcher and indicator
if which xxkb &>/dev/null; then
  xxkb &
fi

# start compositor
if which compton &>/dev/null; then
  compton &
fi

# set ~/.wallpaper as background with feh
if which feh &>/dev/null && test -f ~/.wallpaper; then
  feh --bg-scale ~/.wallpaper
fi

exec i3
