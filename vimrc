set nocompatible

" pathegon is used for easily installing new skripts to
" vim.  Simply install new skipts to the .vim/bundle/
" directory.
call pathogen#infect()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting for the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
endif

filetype plugin on
filetype indent on

set spelllang=de,en
set spellsuggest=10

"------------------------------------
" Behaviour
"------------------------------------
set directory=~/.tmp
set backupdir=~/.tmp
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set hidden
set autoread
set autowrite
if has('mouse')
  set mouse=a
endif
if version >= 730
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
set fileformat=unix

" resume at last cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

set history=50 " keep 50 lines of command line history
set showcmd    " display incomplete commands

" Don't use Ex mode, use Q for formatting
map Q gq

" Automatically change local directory (lch) to current file in buffer but
" not when the file lies in /tmp
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

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
au FileType html,tex,context,noweb,rnoweb noremap <buffer> <Down> gj
au FileType html,tex,context,noweb,rnoweb inoremap <buffer> <Down> <C-O>gj
au FileType html,tex,context,noweb,rnoweb noremap <buffer> <Up> gk
au FileType html,tex,context,noweb,rnoweb inoremap <buffer> <Up> <C-O>gk

"------------------------------------
" Appearance
"------------------------------------
set t_Co=256
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme desert

set cursorline
set number
set showmode
set showcmd
set title
set showmatch

"------------------------------------
" Statusbar
"------------------------------------
set statusline=%F%m%r%h%w\ format=%{&ff}\ type=%Y\ ascii=\%03.3b\ hex=\%02.2B\ pos=%04l,%04v\ %p%%\ len=%L
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
augroup filetypedetect
	au! BufRead,BufNewFile *.tex		setfiletype context
augroup END

"------------------------------------
" NERDTree
"------------------------------------
let g:NERDTreeHijackNetrw=0
autocmd vimenter * if !argc() | NERDTree ~/Dropbox | endif

" ----------------------------------------
" Deal with unwanted spaces
" ----------------------------------------
autocmd FileType c,cpp,java,php,r,tex,noweb,rnoweb,rst autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"------------------------------------
" Custom Keys
"------------------------------------
noremap k :bn<cr>
noremap j :bp<cr>
noremap l :bd<cr>
map <cr> o<Esc>
map h :NERDTreeToggle<cr>
map <Leader>f vip:sm/\n/ <cr>$<cr>
