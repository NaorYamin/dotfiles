-- UI and Color Settings
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Indentation Settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Plugin Manager (lazy.nvim) Path Configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

-- Plugin Specification and Setup
require("lazy").setup({
  { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000, -- Load this first
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Mocha is the darkest/richest dark mode
        transparent_background = false,
        term_colors = true,
      })
      -- Apply the colorscheme
      vim.cmd.colorscheme "catppuccin"
    end
  },
})
