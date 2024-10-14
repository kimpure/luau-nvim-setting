local mapKey = require("utils.keyMapper").mapKey

-- Neotree toggle
vim.cmd([[
nnoremap <silent><F1> :Neotree toggle<CR>
nnoremap <F2> :wincmd h<CR>
nnoremap <F3> :wincmd l<CR>
]])

-- clear search highlights 
mapKey('<leader>h', ':nohlsearch<CR>')	

-- indent
mapKey('<', '<gv', 'v')
mapKey('>', '>gv', 'v')



