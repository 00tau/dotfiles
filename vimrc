set nocompatible

"------------------------------------
" Pathogen
"------------------------------------
" pathegon is used for easily installing new skripts to
" vim.  Simply copy new skipts to the .vim/bundle/
" directory.  They get loaded automatically.
runtime bundle/pathogen/autoload/pathogen.vim
let g:pathogen_disabled = ['vim-pandoc', 'vim-markdown', 'vim-markdownfootnotes']
call pathogen#infect()

"------------------------------------
" Eye candy
"------------------------------------
set t_Co=256
syntax enable
colorscheme wombat256mod
highlight clear SignColumn
highlight link SignColumn LineNr

set cursorline
set number
set showmode
set showcmd
set title
set showmatch

"------------------------------------
" Spellcheck settings
"------------------------------------
set spelllang=en_gb,de
set spellsuggest=10

au FileType text,tex,context,markdown set spell

"------------------------------------
" File type handling
"------------------------------------
filetype plugin on
filetype indent on
set fileformat=unix
set encoding=utf-8
set textwidth=72

au FileType text,tex,context,markdown set nosmartindent

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

"set grepprg=grep\ -nH\ $*

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

" Convenient command to see the difference between the
" current buffer and the file it was loaded from, thus
" the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

"----------------------------------------
" Deal with unwanted spaces
"----------------------------------------
autocmd BufWritePre * :%s/\s\+$//e

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
" Markdown
"------------------------------------
"au BufRead,BufNewFile *.md :set ft=markdown | :set spell
let g:vim_markdown_folding_disabled=1

let g:pandoc_no_empty_implicits = 1
let g:pandoc_no_folding = 1
let vimrplugin_pandoc_args = "--toc"

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

au FileType rmd :compiler r2html

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

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
let NERDTreeIgnore = ['\.log$', '\.tuc$', '\.pdf$', '\.html$', '\.rdat$', '\.aux', '\.bbl', '\.blg', '\.tuc']

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif

"---------------------------------------
" Cntr-P
"---------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf,*.aux,*.bbl,*.blg,*.tuc

"---------------------------------------
" Custom Keys
"---------------------------------------
let g:swap_custom_ops = ['~']

" Unbind some keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>', '<Del>', '<BS>']
    exe prefix . "noremap " . key . " <nop>"
  endfor
endfor

for prefix in ['n', 'v']
  for key in ['+', '-', 'h', 'l']
    exe prefix . "noremap " . key . " <nop>"
  endfor
endfor

noremap l :NERDTreeToggle<cr>
noremap <C-g> :Gstatus<cr>

noremap <C-space> gwap:w<bar>nohl<cr>
noremap <cr> :nohl<cr>
noremap <C-cr> :nohl<cr>
noremap <C-q> :bns<bar>bd#<cr>
noremap <C-k> :bp<cr>
noremap <C-j> :bn<cr>

noremap h F
noremap t f
noremap H T
noremap T t
noremap , ;
noremap ; ,
noremap f }k$
nmap F fa<space>
inoremap <c-f> <right><space>
inoremap <c-b> <c-h>~$$<left>

" Nicer movement with wrapped lines
au FileType html,tex,context,noweb,rnoweb,markdown noremap <buffer> j gj
au FileType html,tex,context,noweb,rnoweb,markdown noremap <buffer> k gk
au FileType txt,markdown noremap <buffer> <space> gwap

au FileType r,rdoc,rmd map <buffer> <space> <LocalLeader>lj
au FileType r,rdoc,rmd map <buffer> <cr> <LocalLeader>cd
"au FileType rmd :nnoremap <buffer> ]] /^#<cr>
"au FileType rmd :nnoremap <buffer> [[ ?^#<cr>

nnoremap <up> {dd}
nnoremap <down> {o<esc>}
