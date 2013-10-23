" local mappings
compiler context

nnoremap <buffer> <space> gwap:w<cr>:silent make %<cr>:silent ! xdotool search --class mupdf key r<cr>

" start-stop formula-block
nnoremap <buffer> <LocalLeader>ff A\placeformula<cr><cr>\startformula<cr>\stopformula<esc>O
inoremap <buffer> <LocalLeader>ff \placeformula<cr><cr>\startformula<cr>\stopformula<esc>O

" start-stop formula-align-block
nnoremap <buffer> <LocalLeader>fa A\placeformula<cr><cr>\startformula\startalign<cr>\stopalign\stopformula<esc>O
inoremap <buffer> <LocalLeader>fa \placeformula<cr><cr>\startformula\startalign<cr>\stopalign \stopformula<esc>O

" Make start-stop block out of the previous word
nnoremap <buffer> <LocalLeader>b ea\start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO
inoremap <buffer> <LocalLeader>b \start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO

" itemize/enumerate
inoremap <buffer> <LocalLeader>en \startitemize<cr><cr>\stopitemize<Up>\item<Space>
inoremap <buffer> <LocalLeader>it <cr>\item<Space>
nnoremap <buffer> <LocalLeader>it A<cr>\item<Space>

" font switching and emphasize
inoremap <buffer> <LocalLeader>em {\em }<Left>
inoremap <buffer> <LocalLeader>sc {\sc }<Left>
inoremap <buffer> <LocalLeader>tt {\tt }<Left>

" stop smart indentation, does not work well with TeX
set autoindent
set nocindent
set nosmartindent

" enable spellcheck
syn spell toplevel
setlocal spell spelllang=en_gb
set spell
