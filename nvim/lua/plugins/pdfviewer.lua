return {
  {
    "3rd/image.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("image").setup({
        backend = "poppler",
      })
    end,
    cmd = { "Image" },
    keys = {
      { "<leader>pi", "<cmd>Image<cr>", desc = "Open PDF/Image Viewer" },
    },
  },
}
