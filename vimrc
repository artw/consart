syntax on
set smartindent
set tabstop=3
set shiftwidth=3
set expandtab
set mouse=a
" vimcommander
noremap <silent> <F11> :cal VimCommanderToggle()<CR>

" unmap arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" change . to not move cursor after repeat
nmap . .`[

set t_Co=256
color xoria256 

filetype plugin on
let mapleader = ","
