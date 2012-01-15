""" settings:
  set smartindent
  set autoindent
  "set scrolljump=5                                  " faster scrolling
  set expandtab                                      " tab emulates 2 spaces
  set shiftwidth=2
  set tabstop=2

  "set mouse=a                                        " enable mouse
  set novisualbell                                   " no flickering
  set noerrorbells                                   " no beep
  set wildmenu                                       " completion menu
  set wildmode=list:longest,full
  set ruler                                          " megaruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
  "set virtualedit=onemore                            " allow cursor beyond last character
  set incsearch                                      " search as we type
  "set hlsearch                                      " highligh search matches
  "set list                                          " show line markers
  set linespace=0                                    " more compact text
  set backspace=2                                    " needed for delimitMate_expand_cr

  syntax on
  filetype plugin indent on

""" appearance:
  set bg=dark 
  set gfn=ProFont:h14

  if has('gui_running')
    set mouse=a "enable mouse
    set guioptions-=T " disable the ugly toolbar
    color ir_black
  else
    set term=$TERM
    set mouse=r "disable mouse
    if &term == "xterm-256color" || &term == "screen-256color" || &term == "putty-256color" 
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

  nmap <silent> <F11> :cal VimCommanderToggle()<CR>
  nmap <F2> :NERDTreeToggle<CR>

  " save an quit:
  nmap <C-Q> :q!<CR>
  nmap <C-S> :w!<CR>

  " do not move cursor after repeat:
  nmap . .`[
  " set leader key to comma:
  let mapleader = ","
  " add ; as command mode key:
  nmap ; :
  " Y as C and D
  nmap Y y$
  " Space to fold/unfold
  nmap <Space> za
  " do not exit visual mode after shifting
  vmap < <gv
  vmap > >gv

  " complete with ctrl+space
  "imap <C-space> <C-N>
  imap <C-L> <Space>=><Space>

""" abbreviations
  " autocomplete xml tags
  nmap <leader>t i</<C-X><C-O><C-R><C-R>x

""" plugin specific stuff
  " set sqlserver as default sql syntax
  let g:sql_type_default = "sqlserver" 
  " enable pathogen
  call pathogen#infect()
  call pathogen#helptags()
  " delimitmate options
  let delimitMate_expand_cr = 1
  let delimitMate_expand_space = 1
