vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
  local use = use
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
    use 'ojroques/nvim-hardline'
    use 'ryanoasis/vim-devicons'
    use 'ellisonleao/glow.nvim'
    use 'mechatroner/rainbow_csv'
    use {'neoclide/coc.nvim', branch = 'release'}
  end
)
vim.g.neon_style = "doom"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
vim.cmd[[colorscheme neon]]

require('hardline').setup {}
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "C-n", action = "open" }
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
