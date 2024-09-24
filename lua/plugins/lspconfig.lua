return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',

    dependencies = {
      'dundalek/lazy-lsp.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local builtin = require 'telescope.builtin'
      local buf = vim.lsp.buf
      local autocmd = vim.api.nvim_create_autocmd
      local augroup = vim.api.nvim_create_augroup

      require('lspconfig.ui.windows').default_options.border = 'single'

      autocmd('LspAttach', {
        group = augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
          end

          map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
          map('gr', builtin.lsp_references, '[G]oto [R]eferences')
          map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rn', buf.rename, '[R]e[n]ame')
          map('<leader>ca', buf.code_action, '[C]ode [A]ction')
          map('K', buf.hover, 'Hover Documentation')
          map('gD', buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = augroup('lsp-highlight', { clear = false })
            autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = buf.document_highlight,
            })

            autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = buf.clear_references,
            })

            autocmd('LspDetach', {
              group = augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = { disable = { 'missing-fields' } },
            hint = { enable = true },
          },
        },
      }
      lspconfig.gopls.setup {}
      lspconfig.nil_ls.setup {}
    end,
  },
  {
    'lhKipp/nvim-nu',
    ft = 'nu',
    opts = {
      use_lsp_features = false,
    },
  },
}
