call plug#begin('~/.vim/plugged')
" plugins
"Plug 'Lokaltog/vim-easymotion'
"Plug 'Rename'
"Plug 'auto-pairs-gentle'
"Plug 'c9s/perlomni.vim',    { 'for': 'perl' }
"Plug 'ctrlpvim/ctrlp.vim',
"Plug 'dbext.vim',           { 'for': 'sql' }
"Plug 'edkolev/tmuxline.vim'
"Plug 'gmarik/sudo-gui.vim'
"Plug 'mcchrish/nnn.vim'
"Plug 'mileszs/ack.vim',     { 'on': 'Ack' }
"Plug 'osyo-manga/vim-over'
"Plug 'sjl/gundo.vim',       { 'on':  'GundoToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'fcpg/vim-osc52'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dhruvasagar/vim-table-mode'
" Syntax support
Plug 'fatih/vim-go',           { 'for': 'go' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'hashivim/vim-vagrant',   { 'for': 'ruby' }
Plug 'pearofducks/ansible-vim'
Plug 'pprovost/vim-ps1',       { 'for': 'ps1' }
Plug 'vim-perl/vim-perl',      { 'for': 'perl' }
Plug 'yko/mojo.vim',           { 'for': 'perl' }

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
"language C
syntax on
filetype plugin indent on

set smartindent
set autoindent
"set scrolljump=5              "  faster scrolling
set scrolloff=5                "  scroll down when on <x> line

set expandtab                  "  tab emulates 2 spaces
set shiftwidth=2
set tabstop=2
" except in Makefiles
autocmd FileType make set noexpandtab

set noeb vb t_vb=              "  no bells and whistles
au GUIEnter * set vb t_vb=

set wildmenu                   "  completion menu
set wildmode=list:longest,full "  complete longest first
set laststatus=2               "  always show the status line
set incsearch                  "  search as we type
"set hlsearch                  "  highlight search matches
"set list                      "  show unprintable chars
set number                     "  show line numbers
set linespace=0                "  more compact text
set autoread                  "  autoreload files after they are changed
"set clipboard=unnamed         "  use system clipboard register by default
"set virtualedit=onemore       "  allow cursor beyond last character
"set virtualedit=all           "  put cursor anywhere in the file
set ignorecase                 "
set smartcase                  "  ignore case when lowercase, don't ignore if not
"set autochdir                 "  auto cd to current file
set cursorline                 "  highlight the line with cursor
set cursorcolumn               "  highlight the column with cursor

if version >=730
  set relativenumber           "  show relative line numbers
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
    set guifont=JetBrainsMono-Medium:h11
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
    set guifont=JetBrainsMono-Medium:h13
  elseif has('gui_gtk')
    set guifont=Source\ Code\ Pro\ Semi-Bold\ 10
    set guifont=JetBrains\ Mono\ NL\ Medium\ 10
  endif
  set guioptions-=T           " disable the ugly toolbar
  set guioptions-=R           " disable right scrollbar if not needed
  set guioptions-=r           "
  set guioptions=c            " do not use gui popup for simple choices
  "set guicursor+=a:blinkon0   " disable cursor blinking

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

" switch tabs
noremap <Leader>1 :tabn 1<CR>
noremap <Leader>2 :tabn 2<CR>
noremap <Leader>3 :tabn 3<CR>
noremap <Leader>4 :tabn 4<CR>
noremap <Leader>5 :tabn 5<CR>
noremap <Leader>6 :tabn 6<CR>
noremap <Leader>7 :tabn 7<CR>
noremap <Leader>8 :tabn 8<CR>
noremap <Leader>9 :tabn 9<CR>
noremap <Leader>` :tablast<CR>

"" plugin bindings
" NERDTree
nmap <F2>      :NERDTreeToggle<CR>
nmap <Leader>t :NERDTreeToggle<CR>
nmap <F3>      :NERDTreeFind<CR>
nmap <Leader>f :NERDTreeFind<CR>

" Startify
nmap <F4>      :Startify<CR>
"nmap <Leader>s :Startify<CR>
" Gundo
"nmap <F5>      :GundoToggle<CR>
"nmap <Leader>u :GundoToggle<CR>

" fzf
nmap <C-p> :Files<CR>
nmap <C-f> :Rg<CR>

" EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" vim-osc52
vmap <C-c> y:Oscyank<CR>
xmap <F7> y:Oscyank<CR>

" gitgutter
nmap <Leader>n <Plug>(GitGutterNextHunk)
nmap <Leader>u <Plug>(GitGutterUndoHunk)
nmap <Leader>N <Plug>(GitGutterPrevHunk)
nmap <Leader>d <Plug>(GitGutterPreviewHunk)

"" plugin settings

"" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    "\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror


" higlight __DATA__ for mojo
let mojo_highlight_data = 1

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
let g:airline_theme = "jellybeans"
"let g:tmuxline_powerline_separators = 1
"let g:tmuxline_preset = "tmux"

" dbext
let g:dbext_default_history_file = "~/.vim/dbext_history"
"let g:dbext_default_buffer_lines = 7 " default rowcount
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

" nerdcommenter: leave a space after comment
let g:NERDSpaceDelims = 1


" vim-ansible hook
au BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible

"" load vimrc.local if available
if filereadable($HOME . "/.vimrc.local")
  so $HOME/.vimrc.local
endif
