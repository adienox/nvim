return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    transparent_background = true,
    integrations = {
      notify = true,
      lsp_saga = true,
      noice = true,
      lsp_trouble = true,
      neotree = true,
      harpoon = true,
      which_key = true,
    },
    styles = {
      comments = { 'italic' },
      conditionals = { 'italic' },
      loops = { 'italic' },
    },
    custom_highlights = function(colors)
      return {
        UfoFoldedEllipsis = { fg = colors.overlay2, bg = colors.none },
        TabLineSel = { bg = colors.pink },

        RenderMarkdownLink = { fg = colors.mauve, style = { 'underline' } },
        Label = { fg = colors.mauve, style = { 'underline' } },
        RenderMarkdownH1Bg = { bg = '#000000' },
        RenderMarkdownH2Bg = { bg = '#000000' },
        RenderMarkdownH3Bg = { bg = '#000000' },
        RenderMarkdownH4Bg = { bg = '#000000' },
        RenderMarkdownH5Bg = { bg = '#000000' },
        RenderMarkdownH6Bg = { bg = '#000000' },
        ['@markup.italic'] = { fg = colors.green },
        ['@markup.strong'] = { fg = colors.red },
        ['@markup.raw.markdown_inline'] = { fg = colors.overlay2, style = { 'italic' } },

        HelpviewHeading1 = { fg = colors.green, bg = '#000000' },
        HelpviewHeading4 = { fg = colors.pink, bg = '#000000' },
        HelpviewCode = { bg = '#000000' },
        HelpviewInlineCode = { link = '@markup.raw.markdown_inline' },
        HelpviewCodeLanguage = { fg = colors.peach, bg = '#000000' },
        HelpviewTaglink = { fg = colors.mauve, bg = colors.none },
        HelpviewOptionlink = { fg = colors.mauve, bg = colors.none, style = { 'underline' } },
        HelpviewMentionlink = { fg = colors.mauve, bg = colors.none, style = { 'underline' } },

        NoiceLspProgress = { link = 'NonText' },
        NoiceLspProgressTitle = { link = 'Constant' },

        TelescopePromptTitle = { fg = colors.pink },
        TelescopeResultsTitle = { fg = colors.peach },
        TelescopePreviewTitle = { fg = colors.green },

        FloatBorder = { fg = colors.base },
        NormalFloat = { fg = colors.surface2 },
      }
    end,
  },
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
}
