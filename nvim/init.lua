-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.api.nvim_set_keymap("n", "<leader>lg", ":Telescope live_grep<CR>", { noremap = true, silent = true })

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
local lspconfig = require("lspconfig")
