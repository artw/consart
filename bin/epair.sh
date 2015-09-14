#!/bin/sh
if [ -z $1 ] || [ -z $2 ]; then
  echo "usage $0 <number> <up/down>"
  return
fi

BRIDGE=bridge0
IF=epair${1}

if [ $2 == "up" ]; then
  ifconfig $IF create >/dev/null
  ifconfig ${IF}a up
  ifconfig $BRIDGE addm ${IF}a
elif [ $2 == "down" ]; then
  ifconfig $BRIDGE deletem ${IF}a
  ifconfig ${IF}a down
  ifconfig ${IF}a destroy
fi
