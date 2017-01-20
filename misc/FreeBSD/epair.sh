#!/bin/sh
if [ -z $1 ] || [ -z $2 ]; then
  echo "usage $0 <number> <up/down>"
  return
fi

BRIDGE=bridge0
IF=epair${1}

if [ $2 == "up" ]; then
  echo "VNET: creating $IF"
  ifconfig $IF create
  echo "VNET: adding ${IF}a to $BRIDGE"
  ifconfig $BRIDGE addm ${IF}a
  echo "VNET: bringing ${IF}a up"
  ifconfig ${IF}a up
elif [ $2 == "down" ]; then
  echo "VNET: bringing ${IF}a down"
  ifconfig ${IF}a down
  echo "VNET: removing ${IF}a from $BRIDGE"
  ifconfig $BRIDGE deletem ${IF}a
  echo "VNET: destroying ${IF}a"
  ifconfig ${IF}a destroy
fi
