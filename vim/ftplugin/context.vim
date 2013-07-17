" local mappings
let maplocalleader = ","

" compile the current file with mkiv
nnoremap <buffer> <LocalLeader>c :exe 'w<Bar>silent !tmux send-keys -t "$(cat /tmp/cur-context-pane)" context " " % C-m'<Bar>redraw!<Cr>
imap <buffer> <LocalLeader>c <esc><LocalLeader>c

" start-stop formula-block
nnoremap <buffer> <LocalLeader>ff A\placeformula<cr><cr>\startformula<cr>\stopformula<esc>O
inoremap <buffer> <LocalLeader>ff \placeformula<cr><cr>\startformula<cr>\stopformula<esc>O

" start-stop formula-algin-block
nnoremap <buffer> <LocalLeader>fa A\placeformula<cr><cr>\startformula\startalign<cr>\stopalign\stopformula<esc>O
inoremap <buffer> <LocalLeader>fa \placeformula<cr><cr>\startformula\startalign<cr>\stopalign \stopformula<esc>O

" Make start-stop block out of the previous word
nnoremap <buffer> <LocalLeader>ta ea\start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO
inoremap <buffer> <LocalLeader>ta \start<Cr>\stop<Cr><Esc>4bhdiw$pj$pO

" itemize/enumerate
inoremap <buffer> <LocalLeader>en \startitemize<cr><cr>\stopitemize<Up>\item<Space>
inoremap <buffer> <LocalLeader>ee <cr>\item<Space>
nnoremap <buffer> <LocalLeader>ee A<cr>\item<Space>

" font switching and emphasize
inoremap <buffer> <LocalLeader>em {\em }<Left>
inoremap <buffer> <LocalLeader>sc {\sc }<Left>
inoremap <buffer> <LocalLeader>tt {\tt }<Left>

" enable spellcheck
syn spell toplevel
