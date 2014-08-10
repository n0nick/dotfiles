" Always jump to the last known cursor position
" from http://vim.cybermirror.org/runtime/vimrc_example.vim
fun! GoToLastPosition()
  if &ft =~ 'gitcommit'
    return
  endif
  if line("'\"") > 1 && line("'\"") <= line("$")
    exe "normal! g`\""
  endif
endfun


autocmd BufReadPost * call GoToLastPosition()
