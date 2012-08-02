let $TEXMFOS="/opt/context-minimals/texmf-linux-64"
let $TEXMFCACHE="$HOME/texmf-cache"
let $PATH.=":/opt/context-minimals/texmf-linux-64/bin"
let $OSFONTDIR="$HOME/.fonts;/usr/share/fonts;"

" compile the document to pdf
imap <F5> <ESC>:make all<CR>
nmap <F5> :make all<CR>

" plot the document to the screen
imap <F6> <ESC>:make show<CR>
nmap <F6> :make show<CR>

" place a formula
iabbr $$ \placeformula<cr><cr>\startformula<cr>\stopformula<esc>O

" start-stop formula-block
nmap <buffer> <LocalLeader>ff A\placeformula<cr><cr>\startformula<cr>\stopformula<esc>O
imap <buffer> <LocalLeader>ff \placeformula<cr><cr>\startformula<cr>\stopformula<esc>O

" start-stop formula-algin-block
nmap <buffer> <LocalLeader>fa A\placeformula<cr><cr>\startformula\startalign<cr>\stopalign\stopformula<esc>O
imap <buffer> <LocalLeader>fa \placeformula<cr><cr>\startformula\startalign<cr>\stopalign \stopformula<esc>O

" Make start-stop block out of the previous word
imap <buffer> <LocalLeader>ta \start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO

" itemize/enumerate
imap <buffer> <LocalLeader>en \startitemize<cr><cr>\stopitemize<Up>\item<Space>
imap <buffer> <LocalLeader>ee <cr>\item<Space>
nmap <buffer> <LocalLeader>ee A<cr>\item<Space>

" font switching and emphasize
imap <buffer> <LocalLeader>em {\em }<Left>
imap <buffer> <LocalLeader>sc {\sc }<Left>

" define... and setup...
imap <buffer> <LocalLeader>de \define
imap <buffer> <LocalLeader>se \setup

" enable spellcheck
syn spell toplevel
set spell spelllang=en
