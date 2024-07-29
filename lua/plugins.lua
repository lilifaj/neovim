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
  }
}
  use 'ojroques/nvim-hardline'
  use 'ryanoasis/vim-devicons'
  use 'ellisonleao/glow.nvim'
  use {
    'neoclide/coc.nvim',
    branch = 'release',
    run = 'yarn install --frozen-lockfile'}
  use 'github/copilot.vim'
  use 'pearofducks/ansible-vim'
  use 'mechatroner/rainbow_csv'
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  end
)

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('hardline').setup {}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.g.coc_filetype_map = {
  ['yaml.ansible'] = 'ansible',
}
vim.g.copilot_filetypes = { ['yaml.ansible'] = true,
                            ['markdown'] = true,
                            ['yaml'] = true
                          }

