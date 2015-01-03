" hit ,f to find the definition of the current class
" this uses ctags. the standard way to get this is Ctrl-]
nnoremap <silent> ,f <C-]>

" use ,F to jump to tag in a vertical split
function! VerticalSplitFindTag(word)
  vsp
  wincmd w
  exec("tag ". word)
endfunction

nnoremap <silen> ,F :call VerticalSplitFindTag(expand("<cword>"))<CR>
