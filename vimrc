""" settings:
   syntax on
   set smartindent
   set autoindent
   set tabstop=3
   set shiftwidth=3
   set expandtab
   set mouse=a
   set vb
   filetype plugin on

""" appearance:
   set bg=dark 
   set gfn=ProFont:h14

   if has('gui_running')
      color xoria256
   else
      set term=$TERM
      if &term == "putty-256color" || &term == "xterm-256color" || &term == "screen-256color"
         set t_Co=256
         color xoria256
      else 
         color desert
      endif
   endif

""" (re)map keys:
   noremap <silent> <F11> :cal VimCommanderToggle()<CR>
   map <F2> :NERDTreeToggle<CR>
   set pastetoggle=<F12>

   " do not move cursor after repeat"
   nmap . .`[

   let mapleader = ","
   " add ; as command mode key
   nnoremap ; :
   " Y as C and D
   nnoremap Y y$
   " do not exit visual mode after shifting
   vnoremap < <gv
   vnoremap > >gv 

""" plugin specific stuff
   " set sqlserver as default sql syntax
   let g:sql_type_default = "sqlserver" 
