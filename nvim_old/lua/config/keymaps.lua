-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("v", "<leader>fc", ":'<,'>!python3 -m c_formatter_42<CR>", {
  desc = "Format C selection with 42 formatter",
  silent = true,
})
