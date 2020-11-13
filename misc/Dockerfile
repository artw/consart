FROM archlinux

RUN pacman -Sy && \
    pacman -S --noconfirm \
      ack            \
      atop           \
      autossh        \
      bind           \
      cpanminus      \
      curl           \
      figlet         \
      fio            \
      git            \
      htop           \
      httpie         \
      inetutils      \
      iperf          \
      iperf3         \
      iproute2       \
      iputils        \
      jq             \
      k9s            \
      kubectl        \
      mc             \
      nmap           \
      nnn            \
      openbsd-netcat \
      openssh        \
      p7zip          \
      pv             \
      pwgen          \
      rclone         \
      rsync          \
      s3cmd          \
      tcpdump        \
      tig            \
      tmux           \
      tree           \
      vifm           \
      vim            \
      w3m            \
      wget           \
      zsh            &&\
    git clone https://github.com/artw/consart .consart && \
    chsh -s /bin/zsh && \
    /bin/zsh .consart/link -f

ENTRYPOINT /bin/zsh
