set nocompatible

"------------------------------------
" Pathogen
"------------------------------------
" pathegon is used for easily installing new skripts to
" vim.  Simply copy new skipts to the .vim/bundle/
" directory.  They get loaded automatically.
runtime bundle/pathogen/autoload/pathogen.vim
let g:pathogen_disabled = [ ]
call pathogen#infect()

"------------------------------------
" Eye candy
"------------------------------------
syntax enable
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

set cursorline
set number
set showmode
set showcmd
set title
set showmatch

"------------------------------------
" Spellchecking settings
"------------------------------------
set spelllang=de,en
set spellsuggest=10

"------------------------------------
" File type handling
"------------------------------------
filetype plugin on
filetype indent on
set fileformat=unix
set encoding=utf-8

"------------------------------------
" Behaviour
"------------------------------------
set directory=~/.tmp/vimswap
set backupdir=~/.tmp/vimbackups
set undodir=~/.tmp/vimundo
set undofile
set undolevels=1000
set undoreload=1000
set history=50
set showcmd
set hidden
set autoread
set joinspaces

if has('mouse')
  set mouse=a
endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

if has("autocmd")
  " resume at last cursor position
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  " Automatically change local directory (lch) to current file in buffer but
  " not when the file lies in /tmp
  autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
endif

set grepprg=grep\ -nH\ $*

"------------------------------------
" Indentation
"------------------------------------
set wrap linebreak textwidth=0 wrapmargin=0 nolist
set tabstop=4
set backspace=2
set shiftwidth=4
set expandtab
set autoindent
set smartindent

"------------------------------------
" Statusbar
"------------------------------------
set statusline=%F%m%r%h%w\ type=%Y\ pos=%04l,%04v\ %p%%\ len=%L
set laststatus=2

"------------------------------------
" Search
"------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set gdefault
set wrapscan

vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"------------------------------------
" R-plugin
"------------------------------------
let g:vimrplugin_nosingler = 0
let g:vimrplugin_tmux = 1
let g:vimrplugin_routmorecolors = 1
let g:vimrplugin_underscore = 0
let g:vimrplugin_indent_commented = 1

let vimrplugin_screenplugin = 0

"------------------------------------
" ConTeXt
"------------------------------------
let g:tex_flavor = "context"

"------------------------------------
" Haskell/Literate Haskell
" -----------------------------------
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/firefox"
let hs_highlight_delimiters = 1 " highlight delimiter characters
let hs_highlight_boolean = 1    " treat True and False as keywords
let hs_highlight_types = 1      " treat names of primitive types as keywords
let hs_allow_hash_operator = 1  " highlight # as operators instead

"------------------------------------
" NERDTree
"------------------------------------
let g:NERDTreeHijackNetrw=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * if !argc() | NERDTree ~/Dropbox | endif

map <f5> :NERDTreeToggle<cr>

" ----------------------------------------
" Deal with unwanted spaces
" ----------------------------------------
autocmd FileType c,cpp,java,php,r,tex,noweb,rnoweb,rst,hs,lhs autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"------------------------------------
" Custom Keys
"------------------------------------
map <cr> o<Esc>

" Nicer movement with wrapped lines
au FileType html,tex,context,noweb,rnoweb noremap <buffer> j gj
au FileType html,tex,context,noweb,rnoweb noremap <buffer> k gk

" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail 
