" Make a start-stop formula-block
nmap <buffer> <LocalLeader>ff \placeformula<cr><cr>\startformula<cr><cr>\stopformula<cr><esc>2<up>I

" Make a start-stop formula-algin-block
nmap <buffer> <LocalLeader>fa \placeformula<cr><cr>\startformula \startalign<cr><cr>\stopalign \stopformula<cr><esc>2<up>I

" Emphasise
iabbrev <buffer> em {\em }<Left>
