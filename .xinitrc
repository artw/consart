wmname LG3D
xscreensaver -no-splash &
dropbox start
autocutsel -fork &
autocutsel -selection PRIMARY -fork &


while true; do
   xsetroot -name "$( date +"%F %R:%S" )"
   sleep 1
done &

#dwm
#awesome
wmii
