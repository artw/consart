#
# Tool installers
# install_ <tool>   — install one tool
# install_ all      — install all binary tools
# install_tools     — same as install_ all
#

# --- shell/plugin installers ---

function install_gocryptfs {
  if iscmd gocryptfs; then
    echo "gocryptfs already installed: $(gocryptfs --version 2>&1 | head -1)"
    return 0
  fi
  if iscmd emerge; then
    sudo emerge --ask=n app-crypt/gocryptfs
    # ensure fusermount compat symlink
    [[ ! -e /bin/fusermount ]] && sudo ln -s fusermount3 /bin/fusermount
  elif iscmd pacman; then
    sudo pacman -S --noconfirm gocryptfs
  elif iscmd apt-get; then
    sudo apt-get install -y gocryptfs
  elif iscmd brew; then
    brew install --cask macfuse
    echo "macFUSE installed — reboot and allow the kernel extension in System Settings > Privacy & Security, then run install_gocryptfs again"
    return 0
  else
    echo "Unsupported package manager — install gocryptfs manually"
    return 1
  fi
}

function _install_gocryptfs_mac_stage2 {
  # run after macFUSE kext is approved and system rebooted
  brew install gromgit/fuse/gocryptfs-mac
}

function install_perlbrew {
  if [[ -d $HOME/.perlbrew ]]; then
    echo "~/.perlbrew already exists, trying to update instead"
    perlbrew self-upgrade
    return
  fi
  export PERLBREW_ROOT=$HOME/.perlbrew
  curl -L http://install.perlbrew.pl | sh
}

function install_vimplug {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function install_antidote {
  if [[ -d ~/.antidote ]]; then
    echo "~/.antidote already exists — run 'antidote update' to update"
    return
  fi
  git clone --depth=1 https://github.com/mattmc3/antidote.git ~/.antidote
  echo "antidote installed — restart shell or run: source ~/.antidote/antidote.zsh && antidote load"
}

function install_tpm {
  git-clone tmux-plugins/tpm ~/.tmux/plugins/tpm
  local runline="run '~/.tmux/plugins/tpm/tpm'"
  local conf="$HOME/.tmux.conf"
  grep $runline $conf &>/dev/null || echo $runline >> $conf
}

# --- binary tool registry (loaded once at source time) ---

typeset -gA _TOOL_REPOS _TOOL_BINS _TOOL_URLS

_TOOL_REPOS=(
  lazygit  "jesseduffield/lazygit"
  k9s      "derailed/k9s"
  kubectl  ""
  fd       "sharkdp/fd"
  rg       "BurntSushi/ripgrep"
  atuin    "atuinsh/atuin"
  fzf      "junegunn/fzf"
)

_TOOL_BINS=(
  lazygit  lazygit
  k9s      k9s
  kubectl  kubectl
  fd       fd
  rg       rg
  atuin    atuin
  fzf      fzf
)

# URL masks — {V} is substituted with version (no leading v)
_TOOL_URLS=(
  "lazygit:darwin:arm64"   "https://github.com/jesseduffield/lazygit/releases/download/v{V}/lazygit_{V}_darwin_arm64.tar.gz"
  "lazygit:darwin:x86_64"  "https://github.com/jesseduffield/lazygit/releases/download/v{V}/lazygit_{V}_darwin_x86_64.tar.gz"
  "lazygit:linux:arm64"    "https://github.com/jesseduffield/lazygit/releases/download/v{V}/lazygit_{V}_linux_arm64.tar.gz"
  "lazygit:linux:x86_64"   "https://github.com/jesseduffield/lazygit/releases/download/v{V}/lazygit_{V}_linux_x86_64.tar.gz"

  "k9s:darwin:arm64"       "https://github.com/derailed/k9s/releases/download/v{V}/k9s_Darwin_arm64.tar.gz"
  "k9s:darwin:x86_64"      "https://github.com/derailed/k9s/releases/download/v{V}/k9s_Darwin_amd64.tar.gz"
  "k9s:linux:arm64"        "https://github.com/derailed/k9s/releases/download/v{V}/k9s_Linux_arm64.tar.gz"
  "k9s:linux:x86_64"       "https://github.com/derailed/k9s/releases/download/v{V}/k9s_Linux_amd64.tar.gz"

  "kubectl:darwin:arm64"   "https://dl.k8s.io/release/v{V}/bin/darwin/arm64/kubectl"
  "kubectl:darwin:x86_64"  "https://dl.k8s.io/release/v{V}/bin/darwin/amd64/kubectl"
  "kubectl:linux:arm64"    "https://dl.k8s.io/release/v{V}/bin/linux/arm64/kubectl"
  "kubectl:linux:x86_64"   "https://dl.k8s.io/release/v{V}/bin/linux/amd64/kubectl"

  # fd dropped Intel macOS since v9.x
  "fd:darwin:arm64"        "https://github.com/sharkdp/fd/releases/download/v{V}/fd-v{V}-aarch64-apple-darwin.tar.gz"
  "fd:linux:arm64"         "https://github.com/sharkdp/fd/releases/download/v{V}/fd-v{V}-aarch64-unknown-linux-gnu.tar.gz"
  "fd:linux:x86_64"        "https://github.com/sharkdp/fd/releases/download/v{V}/fd-v{V}-x86_64-unknown-linux-gnu.tar.gz"

  # ripgrep tag has no v prefix in download path
  "rg:darwin:arm64"        "https://github.com/BurntSushi/ripgrep/releases/download/{V}/ripgrep-{V}-aarch64-apple-darwin.tar.gz"
  "rg:darwin:x86_64"       "https://github.com/BurntSushi/ripgrep/releases/download/{V}/ripgrep-{V}-x86_64-apple-darwin.tar.gz"
  "rg:linux:arm64"         "https://github.com/BurntSushi/ripgrep/releases/download/{V}/ripgrep-{V}-aarch64-unknown-linux-gnu.tar.gz"
  "rg:linux:x86_64"        "https://github.com/BurntSushi/ripgrep/releases/download/{V}/ripgrep-{V}-x86_64-unknown-linux-musl.tar.gz"

  # fzf uses amd64 for x86, no v prefix in filename
  "fzf:darwin:arm64"       "https://github.com/junegunn/fzf/releases/download/v{V}/fzf-{V}-darwin_arm64.tar.gz"
  "fzf:darwin:x86_64"      "https://github.com/junegunn/fzf/releases/download/v{V}/fzf-{V}-darwin_amd64.tar.gz"
  "fzf:linux:arm64"        "https://github.com/junegunn/fzf/releases/download/v{V}/fzf-{V}-linux_arm64.tar.gz"
  "fzf:linux:x86_64"       "https://github.com/junegunn/fzf/releases/download/v{V}/fzf-{V}-linux_amd64.tar.gz"

  # atuin has no Intel macOS release
  "atuin:darwin:arm64"     "https://github.com/atuinsh/atuin/releases/download/v{V}/atuin-aarch64-apple-darwin.tar.gz"
  "atuin:linux:arm64"      "https://github.com/atuinsh/atuin/releases/download/v{V}/atuin-aarch64-unknown-linux-gnu.tar.gz"
  "atuin:linux:x86_64"     "https://github.com/atuinsh/atuin/releases/download/v{V}/atuin-x86_64-unknown-linux-gnu.tar.gz"
)

# --- shared helpers ---

function _tools_os {
  case $(uname -s) in
    Darwin)  echo darwin  ;;
    Linux)   echo linux   ;;
    FreeBSD) echo freebsd ;;
    *) echo "Unsupported OS: $(uname -s)" >&2; return 1 ;;
  esac
}

function _tools_arch {
  case $(uname -m) in
    x86_64|amd64)  echo x86_64 ;;
    aarch64|arm64) echo arm64  ;;
    *) echo "Unsupported arch: $(uname -m)" >&2; return 1 ;;
  esac
}

function _tools_get_version {
  local tool=$1
  if [[ $tool == kubectl ]]; then
    curl -fsSL https://dl.k8s.io/release/stable.txt | sed 's/^v//'
    return
  fi
  local repo=${_TOOL_REPOS[$tool]}
  curl -fsSL "https://api.github.com/repos/${repo}/releases/latest" \
    | python3 -c "import json,sys; print(json.load(sys.stdin)['tag_name'].lstrip('v'))"
}

function _tools_install_bin {
  local tool=$1
  local dest=${2:-$HOME/.bin}
  local bin=${_TOOL_BINS[$tool]}
  local os arch
  os=$(_tools_os)   || return 1
  arch=$(_tools_arch) || return 1

  local url_key="${tool}:${os}:${arch}"
  local url_mask=${_TOOL_URLS[$url_key]}

  if [[ -z $url_mask ]]; then
    echo "  [skip] no release for $url_key"
    return 0
  fi

  if (( $+commands[$bin] )); then
    echo "→ $tool: already in PATH ($(whence $bin)), skipping"
    return 0
  fi

  echo "→ $tool: resolving latest version..."
  local version
  version=$(_tools_get_version $tool) || { echo "  [error] version fetch failed"; return 1 }

  local url=${url_mask//\{V\}/$version}
  echo "  version : $version"
  echo "  url     : $url"

  mkdir -p $dest
  local tmpdir
  tmpdir=$(mktemp -d) || return 1

  if [[ $url == *.tar.gz ]]; then
    curl -fsSL "$url" -o "$tmpdir/archive.tar.gz" || { rm -rf $tmpdir; echo "  [error] download failed"; return 1 }
    tar -xzf "$tmpdir/archive.tar.gz" -C "$tmpdir" || { rm -rf $tmpdir; echo "  [error] extract failed"; return 1 }
    local bin_path
    bin_path=$(find "$tmpdir" -type f -name "$bin" | head -1)
    [[ -z $bin_path ]] && { rm -rf $tmpdir; echo "  [error] '$bin' not found in archive"; return 1 }
    install -m 755 "$bin_path" "$dest/$bin"
  elif [[ $url == *.zip ]]; then
    curl -fsSL "$url" -o "$tmpdir/archive.zip" || { rm -rf $tmpdir; echo "  [error] download failed"; return 1 }
    unzip -q "$tmpdir/archive.zip" -d "$tmpdir" || { rm -rf $tmpdir; echo "  [error] extract failed"; return 1 }
    local bin_path
    bin_path=$(find "$tmpdir" -type f -name "$bin" | head -1)
    [[ -z $bin_path ]] && { rm -rf $tmpdir; echo "  [error] '$bin' not found in archive"; return 1 }
    install -m 755 "$bin_path" "$dest/$bin"
  else
    # direct binary (e.g. kubectl)
    curl -fsSL "$url" -o "$tmpdir/$bin" || { rm -rf $tmpdir; echo "  [error] download failed"; return 1 }
    install -m 755 "$tmpdir/$bin" "$dest/$bin"
  fi

  rm -rf $tmpdir
  echo "  ✓ $dest/$bin"
}

# --- individual binary installers ---

function install_lazygit { _tools_install_bin lazygit }
function install_k9s     { _tools_install_bin k9s     }
function install_kubectl  { _tools_install_bin kubectl }
function install_fd       { _tools_install_bin fd      }
function install_rg       { _tools_install_bin rg      }
function install_atuin    { _tools_install_bin atuin   }
function install_fzf      { _tools_install_bin fzf     }

# --- install all binary tools (or a subset) ---

function install_tools {
  local -a tools
  if [[ $# -gt 0 ]]; then
    tools=($@)
  else
    tools=(${(ok)_TOOL_REPOS})
  fi
  local -a failed=()
  for t in $tools; do
    if (( $+functions[install_${t}] )); then
      install_${t} || failed+=($t)
    else
      echo "Unknown tool: $t  (available: ${(ok)_TOOL_REPOS})"
    fi
  done
  (( ${#failed} > 0 )) && echo "\nFailed: ${(j:, :)failed}" && return 1
  return 0
}

# --- dispatcher: install_ <tool|all> [tool2 ...] ---

function install_ {
  if [[ $# -eq 0 || $1 == all ]]; then
    install_tools
    return
  fi
  local -a failed=()
  for t in $@; do
    if (( $+functions[install_${t}] )); then
      install_${t} || failed+=($t)
    else
      echo "No installer for: $t"
      echo "Available: antidote tpm vimplug perlbrew gocryptfs ${(ok)_TOOL_REPOS}"
      failed+=($t)
    fi
  done
  (( ${#failed} > 0 )) && return 1
  return 0
}
