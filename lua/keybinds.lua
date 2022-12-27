local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('n', '<C-n>', ":NvimTreeToggle<CR>")
