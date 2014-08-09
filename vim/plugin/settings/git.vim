" Turn on spellchecker in Git commit messages
autocmd FileType gitcommit setlocal spell

" Fugitive: open parent tree
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd BufReadPost fugitive://* set bufhidden=delete

" Speed up git-gutter
let g:gitgutter_eager = 0

" GitGrep - open up a git grep line, with a quote started for the search
nnoremap <Leader>gg :GitGrep ""<left>

" Tab expansion for gitconfig (that's the way "git config" does it)
autocmd FileType gitconfig setlocal noexpandtab
