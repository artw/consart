""" settings:
   set smartindent
   set autoindent
   "set scrolljump=5                                  " faster scrolling
   set expandtab                                      " tab emulates 3 spaces
   set shiftwidth=3
   set tabstop=3

   set mouse=a                                        " enable mouse
   set novisualbell                                   " no flickering
   set noerrorbells                                   " no beep
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
" shift + arrows selects text
" behave more like textedit than vim
	"if has("gui_macvim")
	  "let macvim_hig_shift_movement = 1
	"endif

   if has('gui_running')
      set guioptions-=T " disable the ugly toolbar
      color xoria256
   else
      set term=$TERM
      if &term == "xterm-256color" || &term == "screen-256color" || &term == "putty-256color" 
         set t_Co=256
         color xoria256
      else 
         color torte
      endif
   endif

""" custom commands: 
   command Xcdc cd %:p:h
   command Xvimrc edit $MYVIMRC
   command Xrevim source $MYVIMRC
   "" sudo write:
   command Xsuw w !sudo tee % > /dev/null

""" (re)map keys:
   set pastetoggle=<F12>
   let mapleader = ","  " set leader key to comma

   nmap <silent> <F11> :cal VimCommanderToggle()<CR>
   nmap <F2> :NERDTreeToggle<CR>

   " save an quit:
   nmap <C-Q> :q!<CR>
   nmap <C-S> :w!<CR>

   " Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
   nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
   nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
   nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
   nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>   " page up/down:

   " do not move cursor after repeat:
   nmap . .`[
   " set leader key to comma:
   let mapleader = ","
   " add ; as command mode key:
   nmap ; :
   " Y as C and D
   nmap Y y$
   " do not move cursor after repeat
   nmap . .`[           
   " add ; as command mode key
   nmap ; :             
   " like C and D
   nmap Y y$             
   " Space to fold/unfold
   nmap <Space> za
   " do not exit visual mode after shifting
   vmap < <gv
   vmap > >gv            

   map ,vv :vsp $MYVIMRC " edit vimrc
   map ,V :so $MYVIMRC   " reload vimrc

   " complete with ctrl+space
   imap <C-space> <C-N>

""" plugin specific stuff
   " set sqlserver as default sql syntax
   let g:sql_type_default = "sqlserver" 
   call pathogen#infect()
