" Go to last edit location with ,.
nnoremap <Leader>. '.

" Create window splits easier
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
nnoremap <silent> <Leader>cf :let @* = expand("%:~")<CR>
nnoremap <silent> <Leader>cn :let @* = expand("%:t")<CR>

" Swap ` and ' (http://items.sjbach.com/319/configuring-vim-right)
nnoremap ' `
nnoremap ` '
