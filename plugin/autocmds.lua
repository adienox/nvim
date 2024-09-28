-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
local autocmd = vim.api.nvim_create_autocmd

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto resize panes when resizing nvim window
autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('resize', { clear = true }),
  pattern = '*',
  command = 'tabdo wincmd =',
})

-- Remember cursor position
autocmd('BufReadPost', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('remember-cursor-position', { clear = true }),
  callback = function()
    local line = vim.fn.line '\'"'
    if line > 1 and line <= vim.fn.line '$' and vim.bo.filetype ~= 'commit' and vim.fn.index({ 'xxd', 'gitrebase' }, vim.bo.filetype) == -1 then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Disable indentscope in filetypes
local disabled = {
  'harpoon',
  'help',
  'terminal',
  'NvimTree',
  'alpha',
  'markdown',
}

vim.api.nvim_create_autocmd({ 'FileType', 'BufNew', 'BufEnter', 'BufWinEnter' }, {
  pattern = '*',
  callback = function()
    if disabled[vim.bo.filetype] ~= nil or vim.bo.buftype ~= '' then
      vim.b.miniindentscope_disable = true
    end
  end,
})
