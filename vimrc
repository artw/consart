"" vundle
if filereadable($HOME . "/.vim/bundle/vundle/autoload/vundle.vim")
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'
  " plugins
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/syntastic'
  Bundle 'tpope/vim-surround'
  Bundle 'junegunn/vim-easy-align'
  Bundle 'mileszs/ack.vim'
  " colorthemes
  Bundle 'twerth/ir_black'
endif

"" settings:
set smartindent
set autoindent
"set scrolljump=5              "  faster scrolling

set expandtab                  "  tab emulates 2 spaces
set shiftwidth=2
set tabstop=2

set noeb vb t_vb=              "  no bells and whistles
au GUIEnter * set vb t_vb=     

set wildmenu                   "  completion menu
set wildmode=list:longest,full "  complete longest first
set ruler                      "  enable ruler bar
"set virtualedit=onemore       "  allow cursor beyond last character
set incsearch                  "  search as we type
"set hlsearch                  "  highligh search matches
"set list                      "  show unpritable chars
"set nu                        "  show line numbers
set linespace=0                "  more compact text
"set autoread                  "  autoreload files after they are changed
"set clipboard=unnamed          "  use system clipboard register by default

syntax on
filetype plugin indent on

" enable mouse if available
if has('mouse')
  set mouse=a
endif


" gui settings
if has('gui_running')
  " set gui font
  if has('gui_macvim') || has('gui_win32')
    set gfn=ProFont:h14
  elseif has('gui_gtk') 
    set gfn=ProFont\ 11
  endif
  set guioptions-=T           "  disable the ugly toolbar
endif

" set 256 color scheme if possible
set bg=dark 
if has('gui_running') || &t_Co == 256
  colorscheme ir_black
else
  colorscheme torte
endif


"" Xtra commands: 
" chdir to current file
command! CD cd %:p:h
" sudo write:
command! Sudo w !sudo tee % 1> /dev/null 2> /dev/null

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

"" plugins
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)


"" abbreviations
" autocomplete xml tags
nmap <leader>t i</<C-X><C-O><C-R><C-R>x
