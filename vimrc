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
  Plugin 'Rename'
  Plugin 'bling/vim-airline'
  Plugin 'dbext.vim'
  Plugin 'ervandew/supertab'
  Plugin 'gmarik/sudo-gui.vim'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'junegunn/vim-easy-align'
  Plugin 'kien/ctrlp.vim'
  Plugin 'mhinz/vim-startify'
  Plugin 'mileszs/ack.vim'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-surround'
  Plugin 'xolox/vim-misc'
  Plugin 'xolox/vim-session'
  "Plugin 'Valloric/YouCompleteMe'
  "Plugin 'talek/vorax4'
  "Plugin 'vim-perl/vim-perl'
  "Plugin 'yko/mojo.vim'
  "Plugin 'yuratomo/w3m.vim'

  " colorthemes
  Plugin 'nanotech/jellybeans.vim'
  "Plugin 'Lokaltog/vim-distinguished'
  "Plugin 'chriskempson/base16-vim'
  "Plugin 'quanganhdo/grb256'
  "Plugin 'xoria256.vim'

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
set scrolloff=5               "  scroll down when on <x> line

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
set linespace=0                "  more compact text
"set autoread                  "  autoreload files after they are changed
"set clipboard=unnamed         "  use system clipboard register by default
"set virtualedit=onemore       "  allow cursor beyond last character
"set virtualedit=all           "  put cursor anywhere in the file
set ignorecase                 "
set smartcase                  "  ignore case when lowercase, don't ignore if not
"set autochdir                  "  auto cd to current file
set cursorline                 " highlight the line with cursor
set cursorcolumn               " highlight the column with cursor

if version >=730
  set relativenumber             "  show relative line numbers
endif

" enable mouse if available
if has('mouse')
  set mouse=a
endif

" split naturally
set splitright
set splitbelow

" enable unicode if available
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" gui settings
if has('gui_running')
  " set gui font
  if has('gui_macvim')
    set guifont=Source\ Code\ Pro:h14
  elseif has('gui_win32')
    set guifont=Source_Code_Pro_Semibold:h12
  elseif has('gui_gtk')
    set guifont=Source\ Code\ Pro\ Semi-Bold\ 12
  endif
  set guioptions-=T           " disable the ugly toolbar
  set guioptions-=R           " disable right scrollbar if not needed
  set guioptions-=r           "
  set guioptions=c            " do not use gui popup for simple choices
  set guicursor+=a:blinkon0   " disable cursor blinking

  set list                    " show hidden chars
  set listchars=tab:▸\ ,eol:¬,extends:#,nbsp:.,trail:.

  " load perlbrew path if installed
  if filereadable($HOME . ".perlbrew/etc/bashrc")
    let $PATH=system("source " . $HOME . "/perl5/perlbrew/etc/bashrc; echo -n $PATH")
  endif
endif

set bg=dark
colorscheme jellybeans

" set leader key to comma:
let mapleader = ","

"" Extra commands:
" chdir to current file
command! CD cd %:p:h

" sudo write:
command! W SudoWrite

" copy all to system clipboard
command! Y %y*

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

" insert lines below and above
nmap <Leader>o o<ESC>
nmap <Leader>O O<ESC>


" sort shortcut
vmap <Leader>s :sort<CR>

" do not exit visual mode after shifting
vmap < <gv
vmap > >gv


"" plugins
" NERD bindings
nmap <F2>      :NERDTreeToggle<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nmap <F3>      :NERDTreeFind<CR>
nmap <Leader>f :NERDTreeFind<CR>
nmap <F4>      :Startify<CR>
nmap <Leader>s :Startify<CR>
nmap <Leader>p :CtrlP<CR>

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

imap <C-L> ->
imap <C-K> <Space>=><Space>

" higlight __DATA__ for mojo
let mojo_highlight_data = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" vim-session
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" dbext
let g:dbext_default_history_file = $HOME . "/.vim/dbext_history"

"" load vimrc.local if available
if filereadable($HOME . "/.vimrc.local")
  so $HOME/.vimrc.local
endif
