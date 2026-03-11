-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load basic vim options
require("vim-options")

-- Bootstrap lazy.nvim (Plugin Manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and point it to the plugins directory
-- This will automatically load every .lua file in lua/plugins/
require("lazy").setup("plugins")
