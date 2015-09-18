set nocompatible
set encoding=utf-8
scriptencoding utf-8

set guioptions=a

"------------------------------------
" Pathogen
"------------------------------------
" pathegon is used for easily installing new skripts to
" vim.  Simply copy new skipts to the .vim/bundle/
" directory.  They get loaded automatically.
runtime bundle/pathogen/autoload/pathogen.vim
let g:pathogen_disabled = ['tmuxline.vim', 'vim-ipython']
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
set textwidth=102

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
" Lightline
"------------------------------------

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }

"------------------------------------
" Tmuxline
"------------------------------------

let g:tmuxline_powerline_separators = 0

"------------------------------------
" Statusbar
"------------------------------------
"set statusline=%F%m%r%h%w\ type=%Y\ pos=%04l,%04v\ %p%%\ len=%L
set laststatus=2

"------------------------------------
" Markdown
"------------------------------------

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

au FileType python vnoremap <buffer> <cr>    :call SendToTmux(@")<cr>
au FileType python nnoremap <buffer> <space> yy:call SendToTmux(@")<cr>j

"------------------------------------
" Markdown
"------------------------------------
au BufRead,BufNewFile *.md :set ft=markdown | :set spell
let g:vim_markdown_folding_disabled=1

"------------------------------------
" Pandoc
"------------------------------------
let g:pandoc_no_empty_implicits = 1
let g:pandoc_no_folding = 1
let g:vimrplugin_pandoc_args = "--toc"

"------------------------------------
" Mutt
"------------------------------------
" set up syntax highlighting for e-mail
au BufRead,BufNewFile .followup,.article,.letter,/tmp/pico*,nn.*,snd.*,/tmp/mutt* :set ft=mail | :set spell

"------------------------------------
" R-plugin
"------------------------------------
let g:vimrplugin_nosingler = 0
let g:vimrplugin_tmux = 1
let g:Rout_more_colors = 1
let g:vimrplugin_underscore = 0
let g:vimrplugin_indent_commented = 1
let g:vimrplugin_notmuxconf = 1
let g:vimrplugin_screenplugin = 0
let g:vimrplugin_assign = 0
let g:vimrplugin_term = "st"
let g:vimrplugin_vimpager = "vertical"

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

au FileType rmd :compiler r2html
au FileType rmd abbreviate eueu ```{r}<cr>```<C-o>O<C-o>D
au FileType rmd abbreviate euey ```<cr><cr>```{r}<C-o>O<C-o>D

au FileType r,rdoc,rmd map <buffer> <space> <LocalLeader>lj
au FileType r,rdoc,rmd map <buffer> <cr> <LocalLeader>cd

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

set wildignore+=*/tmp/*,*/pkg/*,*.so,*.swp,*.zip,*.pdf,*.aux,*.bbl,*.blg,*.tuc,*.log

"---------------------------------------
" Custom Keys
"---------------------------------------
let g:swap_custom_ops = ['~']

" Unbind some keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Del>', '<BS>']
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

" Navigate buffers
noremap <C-q> :sbn<bar>bd#<cr>
noremap <C-k> :bp<cr>
noremap <C-j> :bn<cr>
noremap <C-n> :b#<cr>

" Quick movements within a line
noremap h F
noremap t f
noremap H T
noremap T t
noremap , ;
noremap ; ,

noremap M `

" Move to the last character of the paragraph,
" enter insert mode, and add a space
noremap f }k$
nmap F fa<space>

" Nicer movement with wrapped lines
au FileType html,tex,context,noweb,rnoweb,markdown noremap <buffer> j gj
au FileType html,tex,context,noweb,rnoweb,markdown noremap <buffer> k gk

" Useful bindings when writing prose
"noremap <space> gw$
"noremap <cr> gwap
noremap <c-space> gw}
noremap <c-cr> :nohl<cr>

au FileType tex,context,latex inoremap <c-f> <right><space>
au FileType tex,context,latex inoremap <c-b> <c-h>~$$<left>

au FileType rmd nnoremap <buffer> ]] /^#<cr>
au FileType rmd nnoremap <buffer> [[ ?^#<cr>

" Movement keys in normal mode are free to bind. Let us use those to turn
" pages in the PDF with the tutorial/help/info-material you are reading.
nnoremap <left> :silent ! xdotool search --class mupdf key --window \%\@ comma<cr>
nnoremap <right> :silent ! xdotool search --class mupdf key --window \%\@ period<cr>
nnoremap <up> :silent ! xdotool search --class mupdf key --window \%\@ H<cr>
nnoremap <down> :silent ! xdotool search --class mupdf key --window \%\@ W<cr>
