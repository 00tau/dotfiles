set nocompatible

"------------------------------------
" Pathogen
"------------------------------------
"
" pathegon is used for easily installing new skripts to
" vim.  Simply copy new skipts to the .vim/bundle/
" directory.  They get loaded automatically.
runtime bundle/pathogen/autoload/pathogen.vim
let g:pathogen_disabled = [ ]
call pathogen#infect()

"------------------------------------
" Eye candy
"------------------------------------
"
set t_Co=256
syntax enable
set hlsearch

let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"

colorscheme github

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
"
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

" Nicer movement with wrapped lines
au FileType html,tex,context,noweb,rnoweb noremap <buffer> j gj
au FileType html,tex,context,noweb,rnoweb inoremap <buffer> j <C-O>gj
au FileType html,tex,context,noweb,rnoweb noremap <buffer> k gk
au FileType html,tex,context,noweb,rnoweb inoremap <buffer> k <C-O>gk

"------------------------------------
" Statusbar
"------------------------------------
"set statusline=%F%m%r%h%w\ format=%{&ff}\ type=%Y\ ascii=\%03.3b\ hex=\%02.2B\ pos=%04l,%04v\ %p%%\ len=%L
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

"------------------------------------
" ConTeXt
"------------------------------------
let g:tex_flavor = "context"

"augroup filetypedetect
"	au! BufRead,BufNewFile *.tex setfiletype context
"augroup END

"------------------------------------
" NERDTree
"------------------------------------
let g:NERDTreeHijackNetrw=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * if !argc() | NERDTree ~/Dropbox | endif

" map h :NERDTreeToggle<cr>

" ----------------------------------------
" Deal with unwanted spaces
" ----------------------------------------
autocmd FileType c,cpp,java,php,r,tex,noweb,rnoweb,rst autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"------------------------------------
" Custom Keys
"------------------------------------
" noremap k :bn<cr>
" noremap j :bp<cr>
" noremap l :bd<cr>
map <cr> o<Esc>
" map <Leader>f vip:sm/\n/ <cr>$<cr>
