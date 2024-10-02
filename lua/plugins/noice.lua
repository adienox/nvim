return {
  'folke/noice.nvim',
  event = 'UiEnter',
  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
        ['config.entry.get_documentation'] = true,
      },
    },

    routes = {
      {
        filter = {
          event = 'msg_show',
          any = {
            { find = '%d+L, %d+B' },
            { find = '; after #%d+' },
            { find = '; before #%d+' },
            { find = '%d fewer lines' },
            { find = '%d more lines' },
          },
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = 'notify',
          find = 'No information available',
        },
        opts = { skip = true },
      },
    },

    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = true, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = true, -- add a border to hover docs and signature help
    },

    views = {
      cmdline_popup = {
        border = {
          style = 'single',
        },
      },
      hover = {
        border = {
          style = 'single',
        },
      },
      cmdline_input = {
        border = {
          style = 'single',
        },
      },
    },

    cmdline = {
      format = {
        cmdline = { title = '' },
        search_down = { title = '' },
        search_up = { title = '' },
        filter = { title = '' },
        lua = { title = '' },
        help = { title = '' },
        input = { title = '' },
      },
    },

    format = {
      lsp_progress = {
        { '{data.progress.message} ', hl_group = 'NoiceLspProgress' },
        { '{data.progress.title} ', hl_group = 'NoiceLspProgressTitle' },
      },
      lsp_progress_done = {
        { '✔ ', hl_group = 'NoiceLspProgressSpinner' },
        { '{data.progress.title} ', hl_group = 'NoiceLspProgressTitle' },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        render = 'compact',
        on_open = function(win)
          if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_set_config(win, { border = 'single' })
          end
        end,
      },
    },
  },
}
