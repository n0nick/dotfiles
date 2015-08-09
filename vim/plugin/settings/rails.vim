" Force Ruby syntax on some filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Bowerfile,Vagrantfile,Thorfile,Capfile,*.rake,*.shy,config.ru,.rspec,.watchr,Guardfile,.simplecov,.autotest,*.prawn} set ft=ruby

" Better key maps for switching between controller and view
nnoremap ,vv :Rview<cr>
nnoremap ,cc :Rcontroller<cr>
