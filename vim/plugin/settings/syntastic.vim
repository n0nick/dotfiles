"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
"don't care about warnings
let g:syntastic_quiet_messages = {'level':'warnings'}

" prefer jshint for javascript syntax checking
let g:syntastic_javascript_syntax_checker="jshint"

" tell HTMLTidy to ignore angular properties
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
