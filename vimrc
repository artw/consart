""" settings:
  set smartindent
  set autoindent
  "set scrolljump=5              "  faster scrolling
  set expandtab                  "  tab emulates 2 spaces
  set shiftwidth=2
  set tabstop=2
  "set mouse=a                   "  enable mouse
  set novisualbell               "  no flickering
  set noerrorbells               "  no beep
  set wildmenu                   "  completion menu
  set wildmode=list:longest,full
  set ruler                      "  megaruler
  "set virtualedit=onemore       "  allow cursor beyond last character
  set incsearch                  "  search as we type
  "set hlsearch                  "  highligh search matches
  "set list                      "  show line markers
  set linespace=0                "  more compact text
  set backspace=2                "  needed for delimitMate_expand_cr
  "set autoread                  "  autoreload files after they are changed

  syntax on
  filetype plugin indent on

""" appearance:
  set bg=dark 
  set gfn=ProFont:h14

  if has('gui_running')
    set mouse=a                 "  enable mouse
    set guioptions-=T           "  disable the ugly toolbar
    color ir_black
  else
    set term=$TERM
    set mouse=r                 "  disable mouse
    if &term == "xterm-256color "  || &term == "screen-256color "  || &term == "putty-256color "
      set t_Co=256
      color ir_black
    else
      color torte
    endif
  endif

""" custom commands: 
  command! Xcdc cd %:p:h
  command! Xvimrc edit $MYVIMRC
  command! Xrevim source $MYVIMRC
  "" sudo write:
  command! Xsuw w !sudo tee % > /dev/null

""" (re)map keys:
  set pastetoggle=<F12>

  nmap <F2> :NERDTreeToggle<CR>

  " file operation shortcuts:
  nmap <C-Q> :q!<CR>
  nmap <C-S> :w!<CR>
  nmap <C-E> :e!<CR>

  " do not move cursor after repeat:
  nmap . .`[

  " set leader key to comma:
  let mapleader = ","
  
  " add ; as command mode key:
  nmap ; :

  " Y as C and D
  nmap Y y$

  " do not exit visual mode after shifting
  vmap < <gv
  vmap > >gv

""" abbreviations
  " autocomplete xml tags
  nmap <leader>t i</<C-X><C-O><C-R><C-R>x

""" plugin specific stuff
  " enable pathogen
  call pathogen#infect()
  call pathogen#helptags()
