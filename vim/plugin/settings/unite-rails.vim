if !exists("unite")
  finish
endif

nnoremap <silent> [unite]rc :<C-u>Unite -no-split -buffer-name=files -start-insert file:app/controllers<cr>
nnoremap <silent> [unite]rh :<C-u>Unite -no-split -buffer-name=files -start-insert file:app/helpers<cr>
nnoremap <silent> [unite]rm :<C-u>Unite -no-split -buffer-name=files -start-insert file:app/models<cr>
nnoremap <silent> [unite]rv :<C-u>Unite -no-split -buffer-name=files -start-insert file:app/views<cr>
nnoremap <silent> [unite]ri :<C-u>Unite -no-split -buffer-name=files -start-insert file:app/inputs<cr>

nnoremap <silent> [unite]rl :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:lib<cr>
nnoremap <silent> [unite]rt :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:spec<cr>

nnoremap <silent> [unite]ra :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:app/assets<cr>
nnoremap <silent> [unite]rj :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:app/assets/javascripts<cr>
nnoremap <silent> [unite]rs :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:app/assets/stylesheets<cr>

nnoremap <silent> [unite]rr :<C-u>edit config/routes.rb<cr>
nnoremap <silent> [unite]rg :<C-u>edit Gemfile<cr>
