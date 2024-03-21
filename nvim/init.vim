filetype plugin indent on

" turn on line numbers
set number

" expand tabs
set expandtab
set tabstop=2 shiftwidth=2 smarttab

" mark tabs, trailing whitespace
set list
set listchars=tab:▸\ ,trail:·

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

" load path
set path+=app/javascript,app/assets/stylesheets/,
autocmd FileType javascript set suffixesadd+=,.jade,jsx,

if has('nvim')
  " fix <C-h> (https://github.com/neovim/neovim/issues/2048)
  nmap <BS> <C-h>

  " exit terminal mode
  tnoremap <Leader>e <C-\><C-n>

  " navigate outside of terminal
  tnoremap <C-w> <C-\><C-n><C-w>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
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

autocmd FileType javascript set formatprg=prettier\ --stdin

autocmd BufRead,BufNewFile *.ts setfiletype typescript
let g:ale_linters = {
\ 'typescript': ['tslint', 'tsserver', 'typecheck'],
\}

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

" Command completion list mode
set wildmode=list:longest

" directory configuration for Notes
let g:notes_directories = ['~/Documents/Notes']

" vim-test configuration
let test#strategy = 'neoterm'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

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

let g:airline_powerline_fonts=1
let g:airline_theme="tomorrow"

set completeopt=menuone

" Change word under cursor and dot repeat via https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
nnoremap c* *Ncgn
nnoremap c# #NcgN

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

" vim-go customization via https://github.com/fatih/vim-go-tutorial
let g:go_list_type = "quickfix"
let g:go_fmt_command="goimports"
let g:go_auto_type_info = 1
let g:go_autodetect_gopath="0"
let g:go_auto_sameids = 1
let g:go_term_enabled = 1 " https://git.io/vDrpg
" https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:deoplete#enable_at_startup = 1

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

autocmd BufReadPost Dockerfile.* set filetype=dockerfile
autocmd BufReadPost Jenkinsfile set filetype=groovy

let g:neoformat_javascript_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin', '--single-quote'],
      \ 'stdin': 1,
      \ }
nnoremap <Leader>f :Neoformat<cr>

" Alternate file jumping for Typescript files (*/foo.ts -> */foo_test.ts)
function! init#typescriptAlternateEdit()
  let l:filename=expand('%:p')

  if l:filename =~ '_test.ts$'
    execute 'edit' substitute(l:filename, '_test.ts$', '.ts', '')
  else
    execute 'edit' substitute(l:filename, '.ts$', '_test.ts', '')
  endif
endfunction
autocmd FileType typescript command! A call init#typescriptAlternateEdit()

" typescript key mappings
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:nvim_typescript#type_info_on_hold = 1
let g:nvim_typescript#default_mappings = 1
" autocmd FileType typescript nmap <C-]> :TSDef<cr>
" autocmd FileType typescript nmap <leader>r :TSRefs<cr>
" autocmd FileType typescript nmap <leader>d :TSDoc<cr>
" autocmd FileType typescript nmap <leader>t :TSType<cr>
" autocmd FileType typescript nmap <leader>i :TSImport<cr>

let g:ale_fixers = {
      \ 'typescript': ['tslint'],
      \ 'javascript': ['eslint'],
      \ }
autocmd FileType typescript nmap <leader>f :ALEFix<cr>

" python virtual environment for Neovim https://neovim.io/doc/user/provider.html#python-virtualenv
if filereadable(expand("~/.config/nvim/py3nvim/bin/python"))
  let g:python3_host_prog = expand("~/.config/nvim/py3nvim/bin/python")
endif

if filereadable(expand("~/.config/nvim/local.vim"))
  source ~/.config/nvim/local.vim
endif
