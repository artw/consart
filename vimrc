""" settings:
   set smartindent
   set autoindent
   "set scrolljump=5                                  " faster scrolling
   set expandtab                                      " tab emulates 3 spaces
   set shiftwidth=3
   set tabstop=3

   set mouse=a                                        " enable mouse
   set vb                                             " visual bell, disables annoying beep
   set wildmenu                                       " completion menu
   set wildmode=list:longest,full

   set ruler                                          " megaruler
   set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
   set virtualedit=onemore                            " allow cursor beyond last character
   set incsearch                                      " search as we type
   "set hlsearch                                      " highligh search matches
   "set list                                          " show line markers
   set linespace=0                                    " more compact text

   syntax on
   filetype plugin indent on

""" appearance:
   set bg=dark 
   set gfn=ProFont:h14

   if has('gui_running')
      set guioptions-=T " disable the ugly toolbar
      color xoria256
   else
      set term=$TERM
      if &term == "putty-256color" || &term == "xterm-256color" || &term == "screen-256color"
         set t_Co=256
         color xoria256
      else 
         color torte
      endif
   endif

""" (re)map keys:
   nmap <silent> <F11> :cal VimCommanderToggle()<CR>
   nmap <F2> :NERDTreeToggle<CR>
   set pastetoggle=<F12>

   " useful shortcuts for save an quit
   nmap <C-Q> :q!<CR>
   nmap <C-S> :w!<CR>

   " do not move cursor after repeat"
   nmap . .`[
   " set leader key to comma
   let mapleader = ","
   " add ; as command mode key
   nmap ; :
   " Y as C and D
   nmap Y y$
   " do not exit visual mode after shifting
   vmap < <gv
   vmap > >gv 

""" plugin specific stuff
   " set sqlserver as default sql syntax
   let g:sql_type_default = "sqlserver" 
