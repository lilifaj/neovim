require('settings')
require('plugins')
require('keybinds')
vim.g.coc_filetype_map = {
  ['yaml.ansible'] = 'ansible',
}
vim.g.copilot_filetypes = { ['yaml.ansible'] = true }

