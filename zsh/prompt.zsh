case $OS_FLAVOR in 
   macosx)
      PS1="[%!]:%B%F{white}@[%F{grey}%m%F{white}]%k %B%F{blue}%1~ %# %b%f%k"
      ;;
   freebsd)
      PS1="[%!]:%B%F{white}@[%F{red}%m%F{white}]%k %B%F{blue}%3~ %# %b%f%k"
      ;;
   arch)
      PS1="[%!]:%B%F{white}@[%F{cyan}%m%F{white}]%k %B%F{blue}%3~ %# %b%f%k"
      ;;
   debian)
      PS1="[%!]:%B%F{yellow}@%F{white}[%F{red}%m%F{white}]%k %B%F{blue}%4~ %# %b%f%k"
      ;;
esac
