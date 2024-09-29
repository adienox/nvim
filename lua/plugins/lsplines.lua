return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  opts = {},
  init = function()
    local g = vim.g

    g.lspline_only_current = true
    vim.diagnostic.config {
      virtual_text = false,
      virtual_lines = { only_current_line = vim.g.lspline_only_current },
      update_in_insert = true,
      severity_sort = true,
    }

    vim.keymap.set('n', '<leader>tl', function()
      g.lspline_only_current = not g.lspline_only_current
      vim.diagnostic.config {
        virtual_lines = { only_current_line = g.lspline_only_current },
      }
    end, { desc = '[L]sp lines' })
  end,
}
