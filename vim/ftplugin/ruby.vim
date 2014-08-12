" Convert hash to 1.9 syntax
" http://robots.thoughtbot.com/convert-ruby-1-8-to-1-9-hash-syntax
nmap <Leader>h :s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>
vmap <Leader>h :s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>
