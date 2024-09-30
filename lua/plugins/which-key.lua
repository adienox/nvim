return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup {
      icons = {
        mappings = false,
      },
    }

    -- Document existing key chains
    require('which-key').add {
      { '<leader>a', group = '[A]ssistant' },
      { '<leader>c', group = '[C]ode' },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>g', group = '[G]it' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>o', group = '[O]bsidian' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>y', group = '[Y]eet' },
    }
  end,
}
