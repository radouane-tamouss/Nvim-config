return {
  {
    dir = vim.fn.expand("~/.config/nvim/lua/custom/todo-timer"),
    name = "todo-timer",
    dev = true,
    lazy = false,
    config = function()
      require("custom.todo-timer").setup()
    end,
  },
}
