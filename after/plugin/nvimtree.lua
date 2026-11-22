local function opts(desc)
  return { desc = "nvim-tree: " .. desc }
end

vim.keymap.set('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', opts('toggle'))
