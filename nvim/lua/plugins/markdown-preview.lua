return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.g.mkdp_theme = "dark" -- Set your desired theme here
  end,
}
