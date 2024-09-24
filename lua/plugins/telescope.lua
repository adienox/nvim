return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  cmd = {
    'Telescope',
  },
  branch = '0.1.x',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local telescope = require 'telescope'
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
        },
        layout_config = {
          height = 0.90,
          width = 0.90,
          horizontal = { preview_width = 0.60 },
          vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
          prompt_position = 'top',
        },
        prompt_prefix = '  ',
        selection_caret = ' ',
        sorting_strategy = 'ascending',
        borderchars = {
          { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
          preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        },
      },

      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')
    pcall(telescope.load_extension, 'noice')

    -- See `:help telescope.builtin`
    local set = vim.keymap.set
    set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    set('n', '<leader>sn', '<cmd>Telescope noice<cr>', { desc = '[S]earch [N]oice' })
    set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  end,
}
