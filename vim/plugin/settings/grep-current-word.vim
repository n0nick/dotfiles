func! EscapeForQuery(text)
  let text = substitute(a:text, '\v(\[|\]|\$|\^)', '\\\1', 'g')
  let text = substitute(text, "'", "''", 'g')
  return text
endfunc

noremap FF :Ggrep <c-r>=EscapeForQuery(expand("<cword>"))<cr><cr>
