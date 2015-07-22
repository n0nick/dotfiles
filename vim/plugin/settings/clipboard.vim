" Interact with system clipboard
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing

" On OS X, make sure vim is installed with +clipboard
" (when in doubt, use 'brew install vim')

set clipboard=unnamed
vmap <Leader>y "*y
map <Leader>p "*p<CR>
map <Leader>P "*P<CR>
