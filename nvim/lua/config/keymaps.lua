-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap

keymap.set("n", "<C-a>", "gg<S-v>G")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("v", "<Leader>'", 'c`<C-r>"`<Esc>', { buffer = true, desc = "Wrap selection with backticks" })
  end,
})
