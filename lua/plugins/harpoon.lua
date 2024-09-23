return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  commit = 'e76cb03',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
    },
  },
  keys = {
    {
      '<leader>ha',
      function()
        require('harpoon'):list():add()
      end,
      desc = '[A]dd Mark',
    },
    {
      '<leader>hl',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = '[L]ist Marks',
    },
    {
      '<leader>hp',
      function()
        require('harpoon'):list():prev()
      end,
      desc = '[P]revious Mark',
    },
    {
      '<leader>hn',
      function()
        require('harpoon'):list():next()
      end,
      desc = '[N]ext Mark',
    },
    {
      '<C-h>',
      function()
        require('harpoon'):list():select(1)
      end,
    },
    {
      '<C-j>',
      function()
        require('harpoon'):list():select(2)
      end,
    },
    {
      '<C-k>',
      function()
        require('harpoon'):list():select(3)
      end,
    },
    {
      '<C-l>',
      function()
        require('harpoon'):list():select(4)
      end,
    },
  },
}
