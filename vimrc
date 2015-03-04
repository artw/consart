"" vundle
if filereadable($HOME . "/.vim/bundle/Vundle.vim/autoload/vundle.vim")
  set rtp+=~/.vim/bundle/Vundle.vim/
  let vundle=1
  let vundle_dir="$HOME/.vim/bundle"
" on windows
elseif filereadable($VIM . "/bundle/Vundle.vim/autoload/vundle.vim")
  set rtp+=$VIM/bundle/Vundle.vim/
  let vundle=1
  let vundle_dir="$VIM/bundle"
endif

if vundle == 1
  call vundle#begin(vundle_dir)
  Plugin 'gmarik/Vundle.vim'
  " plugins
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'bling/vim-airline'
  Plugin 'ervandew/supertab'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'mhinz/vim-startify'
  Plugin 'mileszs/ack.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-surround'
  Plugin 'kien/ctrlp.vim'
  "Plugin 'Valloric/YouCompleteMe'
  "Plugin 'talek/vorax4'
  "Plugin 'yuratomo/w3m.vim'
  " colorthemes
  "Plugin 'xoria256.vim'
  Plugin 'quanganhdo/grb256'
  Plugin 'chriskempson/base16-vim'
  "Plugin 'Lokaltog/vim-distinguished'
  call vundle#end()
endif

" save all temporary files in one dir, make it if it does not exist
if ! isdirectory($HOME . "/.vim")
  call mkdir($HOME . "/.vim")
endif
if ! isdirectory($HOME . "/.vim/tmp")
  call mkdir($HOME . "/.vim/tmp")
endif
set directory=~/.vim/tmp/
set backupdir=~/.vim/tmp/

"" settings:
syntax on
filetype plugin indent on

set smartindent
set autoindent
"set scrolljump=5              "  faster scrolling
"set scrolloff=5               "  scroll down when on <x> line

set expandtab                  "  tab emulates 2 spaces
set shiftwidth=2
set tabstop=2

set noeb vb t_vb=              "  no bells and whistles
au GUIEnter * set vb t_vb=

set wildmenu                   "  completion menu
set wildmode=list:longest,full "  complete longest first
set laststatus=2               "  always show the status line
set incsearch                  "  search as we type
"set hlsearch                  "  highligh search matches
"set list                      "  show unpritable chars
set number                     "  show line numbers
set relativenumber             "  show relative line numbers
set linespace=0                "  more compact text
"set autoread                  "  autoreload files after they are changed
"set clipboard=unnamed         "  use system clipboard register by default
"set virtualedit=onemore       "  allow cursor beyond last character
"set virtualedit=all           "  put cursor anywhere in the file
set ignorecase                 "
set smartcase                  "  ignore case when lowercase, don't ignore if not
"set autochdir                  "  auto cd to current file

" enable mouse if available
if has('mouse')
  set mouse=a
endif

" split naturally
set splitright
set splitbelow

" gui settings
if has('gui_running')
  " set gui font
  if has('gui_macvim') || has('gui_win32')
    set gfn=ProFont:h14
  elseif has('gui_gtk')
    set gfn=ProFont\ 10
  endif
  set guioptions-=T           "  disable the ugly toolbar
endif

" set 256 color scheme if possible (with fallback)
set bg=dark
if has('gui_running') || &t_Co == 256
  try
    colorscheme grb256
  catch
    colorscheme torte
  endtry
else
  colorscheme torte
endif

" set leader key to comma:
let mapleader = ","

"" Extra commands:
" chdir to current file
command! CD cd %:p:h
" sudo write:
command! W w !sudo tee % > /dev/null

"" (re)map keys:
set pastetoggle=<F12>

" file operation bindings:
nmap <C-Q> :q!<CR>
nmap <C-S> :w!<CR>
nmap <C-E> :e!<CR>
nmap <F10> :q<CR>

" do not move cursor after repeat:
nmap . .`[

" add ; as command mode key:
nmap ; :

" Y behaves same as C and D
nmap Y y$

" do not exit visual mode after shifting
vmap < <gv
vmap > >gv

"" plugins
" NERD bindings
nmap <F2>      :NERDTreeToggle<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nmap <F3>      :NERDTreeFind<CR>
nmap <Leader>f :NERDTreeFind<CR>

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)
