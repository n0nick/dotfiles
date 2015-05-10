func! EscapeForQuery(text)
  let text = substitute(a:text, '\v(\[|\]|\$|\^)', '\\\1', 'g')
  let text = substitute(text, "'", "''", 'g')
  return text
endfunc

noremap ff :Ggrep <c-r>=EscapeForQuery(expand("<cword>"))<cr><cr>
