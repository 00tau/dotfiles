set nocompatible

"------------------------------------
" Pathogen
"------------------------------------
" pathegon is used for easily installing new skripts to
" vim.  Simply copy new skipts to the .vim/bundle/
" directory.  They get loaded automatically.
runtime bundle/pathogen/autoload/pathogen.vim
let g:pathogen_disabled = ['yankstack']
call pathogen#infect()

"------------------------------------
" Eye candy
"------------------------------------
set t_Co=256
syntax enable
colorscheme wombat256mod

set cursorline
set number
set showmode
set showcmd
set title
set showmatch

"------------------------------------
" Spellchecking settings
"------------------------------------
set spelllang=en
set spellsuggest=10

"------------------------------------
" File type handling
"------------------------------------
filetype plugin on
filetype indent on
set fileformat=unix
set encoding=utf-8
set textwidth=72

"------------------------------------
" Behaviour
"------------------------------------
set directory=~/.tmp
set backupdir=~/.tmp
set undodir=~/.tmp
set undolevels=1000
set undoreload=1000
set undofile
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

"----------------------------------------
" Deal with unwanted spaces
"----------------------------------------
autocmd FileType c,cpp,java,php,r,tex,noweb,rnoweb,rst,hs,lhs autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"---------------------------------------
" Turn off the annoing beeb
"---------------------------------------
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"---------------------------------------
" Set leader / localleader
"---------------------------------------
let maplocalleader = "\\"

"------------------------------------
" Mutt
"------------------------------------
" set up syntax highlighting for my e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail | :set spell 

"------------------------------------
" R-plugin
"------------------------------------
let g:vimrplugin_nosingler = 0
let g:vimrplugin_tmux = 1
let g:vimrplugin_routmorecolors = 1
let g:vimrplugin_underscore = 0
let g:vimrplugin_indent_commented = 1
let vimrplugin_notmuxconf = 1
let vimrplugin_screenplugin = 0

au FileType r :nmap <buffer> <space> <LocalLeader>lj
au FileType rmd :nmap <buffer> <space> <LocalLeader>cd
au FileType rmd :nmap <buffer> <C-space> gwap
au FileType rmd :nmap <buffer> <cr> <LocalLeader>lj

"------------------------------------
" ConTeXt
"------------------------------------
let g:tex_flavor = "context"

"------------------------------------
" Haskell/Literate Haskell
"------------------------------------
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/firefox"
let hs_highlight_delimiters = 1 " highlight delimiter characters
let hs_highlight_boolean = 1    " treat True and False as keywords
let hs_highlight_types = 1      " treat names of primitive types as keywords
let hs_allow_hash_operator = 1  " highlight # as operators instead

"---------------------------------------
" NERDTree
"---------------------------------------
let g:NERDTreeHijackNetrw=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

noremap l :NERDTreeToggle<cr>

let NERDTreeIgnore = ['\.log$', '\.tuc$', '\.pdf$']

"---------------------------------------
" Custom Keys
"---------------------------------------
noremap <cr> o<Esc>
noremap <C-q> :bd<cr>

noremap h F
noremap t f
noremap H T
noremap T t
noremap , ;

" Nicer movement with wrapped lines
au FileType html,tex,context,noweb,rnoweb noremap <buffer> j gj
au FileType html,tex,context,noweb,rnoweb noremap <buffer> k gk
au FileType txt noremap <buffer> <space> gwap

" Inserts a single character when in command-mode.
" Use the synonyms 'cl' and 'cc' for the standard
" 's' and 'S' instead.
"nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
"nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

" Unbind the cursor keys in insert, normal and visual modes.
"  either use: for key in ['<Up>', '<Down>', '<Left>', '<Right>']
"  or:         for key in ['<Up>', '<Down>']
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Del>', '<BS>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

nnoremap <up> {dd
nnoremap <down> o<esc>
