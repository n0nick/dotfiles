" Always jump to the last known cursor position
" from http://vim.cybermirror.org/runtime/vimrc_example.vim
function! GoToLastPosition()
  if &ft =~ 'gitcommit'
    return
  endif
  if line("'\"") > 1 && line("'\"") <= line("$")
    execute "normal! g`\""
  endif
endfunction


autocmd vimrc BufReadPost * call GoToLastPosition()
