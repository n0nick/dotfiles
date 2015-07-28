" Allow saving of files as sudo when I forgot to start vim using sudo.
" http://stackoverflow.com/a/7078429/107085
cmap w!! w !sudo tee > /dev/null %
