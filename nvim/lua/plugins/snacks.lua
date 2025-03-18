return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  config = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    })
  end,
  keys = {
    {
      "<leader><space>",
      function()
        require("snacks.picker").smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        require("snacks.picker").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        require("snacks.picker").grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>n",
      function()
        require("snacks.explorer")()
      end,
      desc = "File Explorer",
    },
  },
}
