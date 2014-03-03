" local mappings
compiler context

" compiling and manipulating `mupdf`
nnoremap <buffer> <space> gq}:w<cr>:silent make %<cr>:silent ! xdotool search --class mupdf key --window \%\@ r<cr>
nnoremap <buffer> <space> gq}:w<cr>:silent make %<cr>:silent ! xdotool search --class mupdf key --window \%\@ r<cr>
nnoremap <buffer> <LocalLeader>, :silent ! xdotool search --class mupdf key --window \%\@ comma<cr>
nnoremap <buffer> <LocalLeader>. :silent ! xdotool search --class mupdf key --window \%\@ period<cr>
nnoremap <buffer> <LocalLeader>k :silent ! xdotool search --class mupdf key --window \%\@ k<cr>
nnoremap <buffer> <LocalLeader>j :silent ! xdotool search --class mupdf key --window \%\@ j<cr>
nnoremap <buffer> <LocalLeader>W :silent ! xdotool search --class mupdf key --window \%\@ W<cr>
nnoremap <buffer> <LocalLeader>H :silent ! xdotool search --class mupdf key --window \%\@ H<cr>

" Moving around
nnoremap <buffer> ]] /\\section<cr>:nohl<cr>
nnoremap <buffer> [[ ?\\section<cr>:nohl<cr>

" start-stop formula-block
nnoremap <buffer> <LocalLeader>ff A\placeformula<cr><cr>\startformula<cr>\stopformula<esc>O
inoremap <buffer> <LocalLeader>ff \placeformula<cr><cr>\startformula<cr>\stopformula<esc>O

" start-stop aligned formula-block
nnoremap <buffer> <LocalLeader>fa A\placeformula<cr><cr>\startformula \startalign<cr>\stopalign \stopformula<esc>O
inoremap <buffer> <LocalLeader>fa \placeformula<cr><cr>\startformula \startalign<cr>\stopalign \stopformula<esc>O

" Make start-stop block out of the previous word
nnoremap <buffer> <LocalLeader>bb ea\start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO
inoremap <buffer> <LocalLeader>bb \start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO

" itemize
inoremap <buffer> <LocalLeader>en \startitemize<cr><cr>\stopitemize<Up>\item<Space>
inoremap <buffer> <LocalLeader>bu \startbullet<cr><cr>\stopbullet<Up>\item<Space>
inoremap <buffer> <LocalLeader>ii \item<Space>
nnoremap <buffer> <LocalLeader>ii o\item<Space>

" font switching and emphasising
inoremap <buffer> <LocalLeader>em {\em }<Left>
inoremap <buffer> <LocalLeader>bf {\bf }<Left>
inoremap <buffer> <LocalLeader>sc {\sc }<Left>
inoremap <buffer> <LocalLeader>tt {\ss }<Left>
inoremap <buffer> <LocalLeader>ss {\tt }<Left>

nnoremap <buffer> <LocalLeader>bf Bi{\bf <esc>wf:a}<esc>

" stop smart indentation, does not work well with TeX
set autoindent
set nocindent
set nosmartindent
set textwidth=72

" enable spellchecking
syn spell toplevel
setlocal spell spelllang=en_gb,de
set spell
