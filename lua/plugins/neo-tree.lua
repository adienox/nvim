return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  keys = {
    { '<leader>e', '<cmd>Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
    { '<leader><Tab>', '<cmd>Neotree toggle left<CR>', silent = true, desc = 'Left File Explorer' },
    { '<leader>sb', '<cmd>Neotree buffers float<CR>', silent = true, desc = 'Left File Explorer' },
    { '<leader><leader>', '<cmd>Neotree buffers float<CR>', silent = true, desc = 'Buffer Explorer' },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_modified_markers = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
    default_component_configs = {
      indent = {
        with_markers = true,
        with_expanders = true,
      },
      modified = {
        symbol = ' ',
        highlight = 'NeoTreeModified',
      },
      icon = {
        folder_closed = ' ',
        folder_open = ' ',
        folder_empty = ' ',
        folder_empty_open = ' ',
      },
      git_status = {
        symbols = {
          -- Change type
          added = '',
          deleted = '',
          modified = '',
          renamed = '',
          -- Status type
          untracked = '',
          ignored = '',
          unstaged = '',
          staged = '',
          conflict = '',
        },
      },
      last_modified = { enabled = false },
    },
    window = {
      position = 'float',
      width = 35,
      mappings = {
        ['l'] = 'open',
        ['h'] = 'navigate_up',
        ['a'] = {
          'add',
          config = {
            show_path = 'relative', -- "none", "relative", "absolute"
          },
        },
      },
    },
    filesystem = {
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          'node_modules',
        },
        never_show = {
          '.DS_Store',
          'thumbs.db',
          '.obsidian',
          '.stfolder',
        },
      },
      follow_current_file = {
        enabled = true, -- This will find and focus the file in the active buffer every time
        --              -- the current file is changed while the tree is open.
        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      },
    },
    source_selector = {
      winbar = true,
      sources = {
        { source = 'filesystem', display_name = '   Files ' },
        { source = 'buffers', display_name = '   Bufs ' },
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_window_after_open',
        handler = function(args)
          if args.position == 'left' or args.position == 'right' then
            vim.cmd 'wincmd ='
          end
        end,
      },
      {
        event = 'neo_tree_window_after_close',
        handler = function(args)
          if args.position == 'left' or args.position == 'right' then
            vim.cmd 'wincmd ='
          end
        end,
      },
    },
  },
}
