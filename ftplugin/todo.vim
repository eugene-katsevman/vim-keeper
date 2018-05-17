function! KeeperCheck()
    let l:oldn=winnr()
    let l:n=bufwinnr("/tmp/keeper")
    if n < 0
        botright new /tmp/keeper
        setlocal buftype=nofile bufhidden=wipe noswapfile nowrap
    else
        exe l:n . "wincmd w"
    endif
    normal! ggdG
    silent read !keeper
    resize 8
    normal! gg
    exe l:oldn . "wincmd w"
endfunction

function! KeeperUndo()
    s/\[done\] \?//g
endfunction

function! KeeperDone()
    s/ \+$//e
    normal! I[done] 
endfunction

nnoremap <buffer> <localleader>k :silent call KeeperCheck()<cr>
nnoremap <buffer> <localleader>d :call KeeperDone()<cr>
nnoremap <buffer> <localleader>u :call KeeperUndo()<cr>

augroup KeeperGroup
    autocmd!
    autocmd BufWritePost *.todo call KeeperCheck()
augroup END
