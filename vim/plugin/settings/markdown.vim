autocmd BufNewFile,BufReadPost *.md set filetype=markdown

autocmd Filetype markdown setlocal spell
autocmd Filetype markdown setlocal textwidth=80
