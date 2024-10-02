return {
  'kevinhwang91/nvim-ufo',
  event = 'UIEnter',
  dependencies = { 'kevinhwang91/promise-async', 'neovim/nvim-lspconfig' },
  init = function()
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    local ufo = require 'ufo'
    local set = vim.keymap.set

    set('n', 'zR', ufo.openAllFolds)
    set('n', 'zM', ufo.closeAllFolds)
    set('n', 'zK', function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end)
    local ftMap = {
      vim = 'indent',
      python = { 'indent' },
      git = '',
    }

    local function customizeSelector(bufnr)
      local function handleFallbackException(err, providerName)
        if type(err) == 'string' and err:match 'UfoFallbackException' then
          return require('ufo').getFolds(providerName, bufnr)
        else
          return require('promise').reject(err)
        end
      end

      return require('ufo')
        .getFolds(bufnr, 'lsp')
        :catch(function(err)
          return handleFallbackException(err, 'treesitter')
        end)
        :catch(function(err)
          return handleFallbackException(err, 'indent')
        end)
    end

    ufo.setup {
      preview = {
        win_config = {
          border = 'single',
        },
      },

      provider_selector = function(bufnr, filetype, buftype)
        if vim.bo[bufnr].bt == 'nofile' then
          return ''
        end
        return ftMap[filetype] or customizeSelector
      end,
    }
  end,
}
