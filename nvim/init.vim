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

" Quickly update stuff
set updatetime=100

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
vmap <Leader>y "+y
map <Leader>p "+p<CR>
map <Leader>P "+P<CR>

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
autocmd BufRead,BufNewFile *.jsx setfiletype javascript

" load installed plugs
source ~/.config/nvim/plugs.vim

" color scheme
if has('mac')
  color Tomorrow-Night-Eighties
else
  if filereadable(expand("~/.vimrc_background"))
    set t_Co=256
    let base16colorspace=256
    source ~/.vimrc_background
    highlight! link MatchParen StatusLine
  endif
endif

" run neomake on the current file on every write
autocmd! vimrc BufWritePost * Neomake | lwindow

" Command completion list mode
set wildmode=list:longest

" directory configuration for Notes
let g:notes_directories = ['~/Documents/Notes']

" vim-test configuration
let test#strategy = 'neoterm'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

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

if has('mac')
  let g:tagbar_ctags_bin="~/.homebrew/bin/ctags"
endif

let g:airline_powerline_fonts=1
let g:airline_theme="tomorrow"

" Tell Neomake about local ESLint https://git.io/v6e1e
let b:neomake_javascript_eslint_exe = nrun#Which('eslint')
let b:neomake_javascript_enabled_makers = ['eslint']

set completeopt=menuone

" vim-go customization via https://github.com/fatih/vim-go-tutorial
let g:go_list_type = "quickfix"
let g:go_fmt_command="goimports"
let g:go_auto_type_info = 1
let g:go_autodetect_gopath="0"
let g:go_auto_sameids = 1

autocmd FileType go set autowrite
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go nmap <Leader>i <Plug>(go-info)

function! s:build_go_files() " :GoBuild or :GoTestCompile based on the go file
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd BufRead,BufNewFile Dockerfile.* set ft=dockerfile

source ~/.config/nvim/local.vim
