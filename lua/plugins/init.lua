return {
  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {
      ignore = '^$',
    },
  },

  {
    'mbbill/undotree',
    keys = {
      {
        '<leader>tu',
        mode = { 'n' },
        '<cmd>UndotreeToggle<CR>',
        desc = '[U]ndo Tree',
      },
    },
  },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'TroubleToggle',
    keys = {
      {
        '<leader>tt',
        mode = { 'n' },
        '<cmd>Trouble diagnostics<CR>',
        desc = '[T]rouble',
      },
    },
    opts = {},
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'Wansmer/treesj',
    cmd = 'TSJToggle',
    keys = {
      {
        '<leader>ts',
        mode = { 'n' },
        '<cmd>TSJToggle<CR>',
        desc = '[S]plit toggle',
      },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  {
    'okuuva/auto-save.nvim',
    cmd = 'ASToggle',
    event = { 'InsertLeave' },
    opts = {
      enabled = true,
      execution_message = {
        enabled = false,
      },
      trigger_events = {
        immediate_save = { 'BufLeave', 'FocusLost' },
        defer_save = {},
        cancel_defered_save = { 'InsertEnter' },
      },
      condition = nil,
      write_all_buffers = false,
      noautocmd = false,
      lockmarks = false,
      debounce_delay = 500,
      debug = false,
    },
  },

  {
    'OXY2DEV/helpview.nvim',
    ft = 'help',

    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
}
