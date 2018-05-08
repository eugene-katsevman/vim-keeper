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

nnoremap <buffer> <localleader>k :silent call KeeperCheck()<cr>

augroup KeeperGroup
    autocmd!
    autocmd BufWritePost *.todo call KeeperCheck()
augroup END
