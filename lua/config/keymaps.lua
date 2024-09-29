-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
local set = vim.keymap.set

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quality of life
set({ 'n', 'v' }, 'H', '^')
set({ 'n', 'v' }, 'L', '$')
set({ 'n', 'v' }, 'j', 'gj')
set({ 'n', 'v' }, 'k', 'gk')
set({ 'n', 'i' }, '<C-n>', function()
  vim.fn.jobstart { 'tmux', 'switch-client', '-l' }
end)

set('n', '<leader>ms', function()
  local spell = vim.opt.spell:get()
  vim.opt.spell = not spell
end, { desc = '[S]pellcheck' })

set('n', '<leader>x', '<cmd>source %<CR>', { desc = 'E[X]ecute current file' })
set('n', '<leader>n', '<cmd>Noice dismiss<CR>', { desc = 'Dismiss [N]otifications' })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
