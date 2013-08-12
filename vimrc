"" settings:
set smartindent
set autoindent
"set scrolljump=5              "  faster scrolling
"
set expandtab                  "  tab emulates 2 spaces
set shiftwidth=2
set tabstop=2

"set mouse=a                   "  enable mouse
set novisualbell               "  no flickering
set noerrorbells               "  no beep
set wildmenu                   "  completion menu
set wildmode=list:longest,full
set ruler                      "  enable ruler bar
"set virtualedit=onemore       "  allow cursor beyond last character
set incsearch                  "  search as we type
"set hlsearch                  "  highligh search matches
"set list                      "  show unpritable chars
"set nu                        "  show line numbers
set linespace=0                "  more compact text
"set autoread                  "  autoreload files after they are changed

syntax on
filetype plugin indent on

set bg=dark 

" enable mouse if available
if has('mouse')
  set mouse=a
endif
"

if has('gui_running')
  " set gui font
  if has('gui_mac') || has('gui_win32')
    set gfn=ProFont:h14
  elseif has('gui_gtk') 
    set gfn=ProFont\ 11
  endif
  set guioptions-=T           "  disable the ugly toolbar
  color ir_black              "  256 color scheme
else
  set term=$TERM
  if &term == "xterm-256color" || &term == "screen-256color" || &term == "putty-256color"
    set t_Co=256
    color ir_black
  else
    color torte               "  fallback color scheme
  endif
endif
""

"" Xtra commands: 
command! Xcdc cd %:p:h
command! Xvimrc edit $MYVIMRC
command! Xrevim source $MYVIMRC
" sudo write:
command! Xsuw w !sudo tee % > /dev/null

"" (re)map keys:
set pastetoggle=<F12>

nmap <F2> :NERDTreeToggle<CR>

" file operation bindings:
nmap <C-Q> :q!<CR>
nmap <C-S> :w!<CR>
nmap <C-E> :e!<CR>
nmap <F10> :q<CR>

" do not move cursor after repeat:
nmap . .`[

" set leader key to comma:
let mapleader = ","

" add ; as command mode key:
nmap ; :

" Y behaves same as C and D
nmap Y y$

" do not exit visual mode after shifting
vmap < <gv
vmap > >gv

"" abbreviations
" autocomplete xml tags
nmap <leader>t i</<C-X><C-O><C-R><C-R>x
"
""

"" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" bundles
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Align'
"
""
