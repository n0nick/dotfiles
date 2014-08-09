" Always jump to the last known cursor position
" from http://vim.cybermirror.org/runtime/vimrc_example.vim
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
