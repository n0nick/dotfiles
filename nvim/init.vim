filetype plugin indent on

" turn on line numbers
set number

" expand tabs
set expandtab
set tabstop=2 shiftwidth=2 smarttab

" mark tabs, trailing whitespace
set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Show 80 characters column line
set colorcolumn=80

" set leader key
let g:mapleader=","

" allow escaping with jk
inoremap jk <esc>

" go to last edit location
nnoremap <Leader>. '.

" easy window splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

if has('nvim')
  " fix <C-h> (https://github.com/neovim/neovim/issues/2048)
  nmap <BS> <C-h>

  " exit terminal mode
  tnoremap <Leader>e <C-\><C-n>
end

" easy window navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l

" leave current buffer only
nnoremap <silent> <C-w>b :Bufonly<CR>

" system clipboard
vmap <Leader>y "*y
map <Leader>p "*p<CR>
map <Leader>P "*P<CR>

" easy file navigation http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Sudo save http://stackoverflow.com/a/7078429/107085
cmap w!! w !sudo tee > /dev/null %

" diff vertically
set diffopt+=vertical

" define a group `vimrc` and initialize.
augroup vimrc
  autocmd!
augroup END

" turn on spellchecker in Git commit messages
autocmd vimrc FileType gitcommit setlocal spell

" automatically open quickfix window for grep results
autocmd vimrc QuickFixCmdPost *grep* cwindow

" .es6 files are javascript
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" load installed plugs
source ~/.config/nvim/plugs.vim

" color scheme
color Tomorrow-Night-Eighties

" run neomake on the current file on every write
autocmd! vimrc BufWritePost * Neomake | lwindow

" Command completion list mode
set wildmode=list:longest

" directory configuration for Notes
let g:notes_directories = ['~/Documents/Notes']

" vim-test configuration
let test#strategy = 'neoterm'
let test#ruby#rspec#executable = 'bundle exec rspec'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Expand Ruby text objects
call expand_region#custom_text_objects('ruby', {
  \ 'ir' :0,
  \ 'ar' :0,
  \ })

" http://blog.sanctum.geek.nz/vim-command-typos/
if has("user_commands")
  command! -bang -nargs=? -complete=file E e<bang> <args>
  command! -bang -nargs=? -complete=file W w<bang> <args>
  command! -bang -nargs=? -complete=file Wq wq<bang> <args>
  command! -bang -nargs=? -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>

  command! -bang Bd bd<bang>
  command! -bang -nargs=? -complete=option Set set<bang> <args>
endif

let g:go_fmt_command="goimports"
let g:go_autodetect_gopath="0"

let g:tagbar_ctags_bin="~/.homebrew/bin/ctags"

set completeopt=menuone,noinsert
