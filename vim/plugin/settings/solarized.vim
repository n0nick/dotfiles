colorscheme solarized

let g:solarized_termcolors=256

" https://coderwall.com/p/1b30wg
if strftime("%H") >= 5 && strftime("%H") <= 17
  set background=light
  let s:non_text=252
else
  set background=dark
  let s:non_text=236
endif
exe "hi! NonText ctermfg=" .s:non_text

