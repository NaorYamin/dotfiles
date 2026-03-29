-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Start selecting and move right (Normal mode)
vim.keymap.set("n", "<C-S-Right>", "v<Right>", { desc = "Select right" })
-- Start selecting and move left (Normal mode)
vim.keymap.set("n", "<C-S-Left>", "v<Left>", { desc = "Select left" })

-- Continue selecting right/left while already in Visual mode
vim.keymap.set("v", "<C-S-Right>", "<Right>", { desc = "Extend selection right" })
vim.keymap.set("v", "<C-S-Left>", "<Left>", { desc = "Extend selection left" })

-- Selection in Insert mode (Goes to visual mode and starts selecting)
vim.keymap.set("i", "<C-S-Right>", "<Esc>lv<Right>", { desc = "Select right from insert" })
vim.keymap.set("i", "<C-S-Left>", "<Esc>v<Left>", { desc = "Select left from insert" })
