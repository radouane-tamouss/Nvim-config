-- presence.lua
return {
  "andweeb/presence.nvim",
  config = function()
    require("presence"):setup({
      -- Optional settings
      auto_update = true, -- Update Discord status automatically
      neovim_image_text = "Neovim IDE", -- Text displayed for the Neovim image
      main_image = "file", -- Main image to use ("file" or "neovim")
      debounce_timeout = 10, -- Debounce updates (in seconds)
      enable_line_number = false, -- Show line numbers in Discord
      buttons = false, -- Enable workspace/project buttons
      show_filename = false, -- Don't show the file you're working on
      disable = true,
    })
  end,
}
