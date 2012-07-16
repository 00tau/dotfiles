" compile the document to pdf
imap <F5> <ESC>:make all<CR>
nmap <F5> :make all<CR>

" plot the document to the screen
imap <F6> <ESC>:make show<CR>
nmap <F6> :make show<CR>

" place a formula
iabbr $$ \placeformula<cr><cr>\startformula<cr><cr>\stopformula<cr><Up><Up>

" start-stop formula-block
nmap <buffer> <LocalLeader>ff A\placeformula<cr><cr>\startformula<cr><cr>\stopformula<cr><esc>2<up>I
imap <buffer> <LocalLeader>ff \placeformula<cr><cr>\startformula<cr><cr>\stopformula<cr><esc>2<up>I

" start-stop formula-algin-block
nmap <buffer> <LocalLeader>fa A\placeformula<cr><cr>\startformula\startalign<cr><cr>\stopalign\stopformula<cr><esc>2<up>I
imap <buffer> <LocalLeader>fa \placeformula<cr><cr>\startformula\startalign<cr><cr>\stopalign \stopformula<cr><esc>2<up>I

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
