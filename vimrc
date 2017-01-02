call plug#begin('~/.vim/plugged')
" plugins
Plug 'airblade/vim-gitgutter'
Plug 'c9s/perlomni.vim',    { 'for': 'perl' }
Plug 'dbext.vim',           { 'on': 'DBPromptForBufferParameters' }
Plug 'edkolev/tmuxline.vim'
Plug 'ervandew/supertab'
Plug 'gmarik/sudo-gui.vim'
Plug 'auto-pairs-gentle'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim',      { 'on':  'CtrlP' }
Plug 'Lokaltog/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim',     { 'on': 'Ack' }
Plug 'osyo-manga/vim-over'
Plug 'Rename'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle','NERDTreeFind'] }
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim',       { 'on':  'GundoToggle' }
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-perl/vim-perl',   { 'for': 'perl' }
Plug 'yko/mojo.vim',        { 'for': 'perl' }
Plug 'fatih/vim-go',        { 'for': 'go' }
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"Plug 'talek/vorax4'
"Plug 'yuratomo/w3m.vim'

" colorthemes
Plug 'nanotech/jellybeans.vim'
"Plug 'Lokaltog/vim-distinguished'
"Plug 'chriskempson/base16-vim'
"Plug 'quanganhdo/grb256'
"Plug 'xoria256.vim'

call plug#end()

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
language C
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
    let $LANG = "en_GB.UTF-8"
    " cmd + <n> binds for tab switching
    noremap <D-1> :tabn 1<CR>
    noremap <D-2> :tabn 2<CR>
    noremap <D-3> :tabn 3<CR>
    noremap <D-4> :tabn 4<CR>
    noremap <D-5> :tabn 5<CR>
    noremap <D-6> :tabn 6<CR>
    noremap <D-7> :tabn 7<CR>
    noremap <D-8> :tabn 8<CR>
    noremap <D-9> :tabn 9<CR>
    noremap <D-0> :tablast<CR>
  elseif has('gui_win32')
    set guifont=Source_Code_Pro_Semibold:h12
  elseif has('gui_gtk')
    set guifont=Source\ Code\ Pro\ Semi-Bold\ 10
  endif
  set guioptions-=T           " disable the ugly toolbar
  set guioptions-=R           " disable right scrollbar if not needed
  set guioptions-=r           "
  set guioptions=c            " do not use gui popup for simple choices
  set guicursor+=a:blinkon0   " disable cursor blinking

  set list                    " show hidden chars
  set listchars=tab:▸\ ,eol:¬,extends:#,nbsp:.,trail:.
  " load consart
  if filereadable($HOME . "/.zshrc")
    let PATH = system("source " . $HOME . "/.zshrc")
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
nmap <F5>      :GundoToggle<CR>
nmap <Leader>u :GundoToggle<CR>
nmap <F7>      :CtrlP<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>o :OverCommandLine

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
let g:tmuxline_powerline_separators = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = "jellybeans"

" dbext
let g:dbext_default_history_file = $HOME . "/.vim/dbext_history"
let g:dbext_default_buffer_lines = 7 " default rowcount
let g:dbext_default_use_sep_result_buffer = 1 " result buffer for each window

" startify
let g:startify_bookmarks = [ '~/.vimrc', '~/.vimrc.local', '~/.ssh/config' ]
let g:startify_session_persistence = 1

" syntastic
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = [ "perl", "perlcritic", "podchecker" ]
let g:syntastic_perl_lib_path = ['./lib', './extlib', './extlib/lib/perl5']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" supertab: use context completion by default
let g:SuperTabDefaultCompletionType = "context"

" gentle pairs
let g:AutoPairsUseInsertedCount = 1

"" load vimrc.local if available
if filereadable($HOME . "/.vimrc.local")
  so $HOME/.vimrc.local
endif
