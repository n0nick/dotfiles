" open diff vertically by default
set diffopt+=vertical

" diff between the current buffer and the file it was loaded from
" via http://vim.cybermirror.org/runtime/vimrc_example.vim
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
