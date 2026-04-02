return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- קיצורי דרך (Keymaps)
      keymap = { 
        preset = 'default',
        ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<CR>'] = { 'accept', 'fallback' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      -- מקורות להשלמה (Sources)
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- עיצוב חלונות ההשלמה (דומה ל-bordered שהיה לך)
      completion = {
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
      },
    },
    opts_extend = { "sources.default" }
  },
}
