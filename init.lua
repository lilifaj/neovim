require('settings')
require('plugins')
require('keybinds')

vim.cmd [[
  autocmd BufRead,BufNewFile *.tf set filetype=terraform
]]
