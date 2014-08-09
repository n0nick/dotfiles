" Inspired by:
" https://github.com/bling/dotvim/blob/master/vimrc
" http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html

" Some settings
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

call unite#custom#profile('default', 'context', {
      \ 'winheight': 10,
      \' direction': 'botright',
      \ })

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.sass-cache/',
      \ 'tmp/',
      \ ], '\|'))

call unite#set_profile('files', 'smartcase', 1)

" Cache and history
let g:unite_source_rec_max_cache_files=5000
let g:unite_source_history_yank_enable=1

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <ESC>OB <Plug>(unite_select_next_line)
  imap <buffer> <ESC>OA <Plug>(unite_select_previous_line)

  " Actions
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')

  " Prevent arrow keys
  noremap <silent> <ESC>OB j
  noremap <silent> <ESC>OA k
  noremap <silent> <ESC>OC h
  noremap <silent> <ESC>OD l

  " Exit via Q or esc
  nmap <buffer> <esc> <plug>(unite_exit)
endfunction

" The key mappings
nmap <space> [unite]
nnoremap [unite] <nop>
nnoremap <silent> [unite]t :<C-u>Unite -buffer-name=files -start-insert -winheight=10 file_rec/async:!<cr>
nnoremap <silent> [unite]f :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <silent> [unite]e :<C-u>Unite -no-split -buffer-name=mru   -start-insert file_mru<cr>
nnoremap <silent> [unite]y :<C-u>Unite -no-split -buffer-name=yank  -auto-resize history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -no-split -buffer-name=line  -auto-resize line<cr>
nnoremap <silent> [unite]o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=buffer buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-split -buffer-name=search -no-quit grep:.<cr>
