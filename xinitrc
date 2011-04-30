wmname LG3D
xscreensaver -no-splash &
dropbox start

while true; do
   xsetroot -name "$( date +"%F %R:%S" )"
   sleep 1
done &

dwm
#awesome
#wmii
