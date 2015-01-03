" http://vimcasts.org/episodes/tidying-whitespace/

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let l:last_search=@/
  let l:line = line(".")
  let l:column = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=l:last_search
  call cursor(line, column)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
