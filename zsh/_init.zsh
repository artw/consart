# find out what OS we are running
if [[ "$(uname)" == "Linux" ]]; then
   OS="linux"
   if [[ -f /etc/gentoo-release ]]; then
      OS_FLAVOR="gentoo"
   elif [[ -f /etc/arch-release ]]; then
      OS_FLAVOR="arch"
   elif [[ -f /etc/redhat-release ]]; then
      OS_FLAVOR="redhat"
   elif [[ -f /etc/debian_version ]]; then
      OS_FLAVOR="debian"
   elif [[ `uname -m` == 'mips' ]]; then
      OS_FLAVOR="optware"
   fi

elif [[ "$(uname)" == "OpenBSD" ]]; then
   OS="openbsd"
   OS_FLAVOR="openbsd"

elif [[ "$(uname)" == "FreeBSD" ]]; then
   OS="freebsd"
   OS_FLAVOR="freebsd"

elif [[ "$(uname)" == "Darwin" ]]; then
   OS="macos"
   OS_FLAVOR="macosx"
fi

export OS OS_FLAVOR

