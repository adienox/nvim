local opt = vim.opt_local

opt.conceallevel = 2
opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
opt.expandtab = false
opt.tabstop = 4

local current_file_path = vim.fn.expand '%:p'
if string.match(current_file_path, 'Documents/Zettels') then
  vim.keymap.del('n', '<leader>sf')
  vim.keymap.set('n', '<leader>sf', '<cmd>ObsidianQuickSwitch<CR>', { desc = '[S]earch Notes' })
end
