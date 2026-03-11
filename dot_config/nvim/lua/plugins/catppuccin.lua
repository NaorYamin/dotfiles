return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load this first
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        term_colors = true,
      })
      -- Apply the colorscheme
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
