-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_keymap("n", "<leader>lg", ":Telescope live_grep<CR>", { noremap = true, silent = true })

vim.opt.termguicolors = true
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
require("lspconfig").clangd.setup({
  on_attach = function(client, bufnr)
    vim.bo[bufnr].expandtab = false
    vim.bo[bufnr].tabstop = 4
    vim.bo[bufnr].shiftwidth = 4
  end,
})
-- Assuming you are using 'which-key' for keybindings
local wk = require("which-key")

wk.register({
  ["<leader>ae"] = { "<cmd>AerialToggle!<CR>", "Toggle Aerial" },
  ["nf"] = { "<cmd>AerialNext<CR>", "Aerial Next" },
  ["pf"] = { "<cmd>AerialPrev<CR>", "Aerial Previous" },
  ["<leader>ao"] = { "<cmd>AerialOpen<CR>", "Aerial Open" },
})

local lspconfig = require("lspconfig")
