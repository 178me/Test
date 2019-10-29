" 快捷键操作
autocmd Filetype markdown inoremap ,. <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ，。 <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,n <Space>---<Enter><Enter>
autocmd Filetype markdown inoremap ,b <Space>**** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s <Space>~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i <Space>** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d <Space>`` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c <Space>```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>
autocmd Filetype markdown inoremap ,m ()<++><Esc>F)i

