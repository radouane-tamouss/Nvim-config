return {
  "mrjones2014/mdpreview.nvim",
  ft = "markdown",
  dependencies = { "norcalli/nvim-terminal.lua", config = true },
  config = function()
    require("mdpreview").setup({
      cli_args = { "glow", "-s", "dark", "-w", "1", "--local" },
      filetypes = { "markdown", "markdown.pandoc", "markdown.gfm" },
    })
  end,
}
