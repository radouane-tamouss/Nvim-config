# My Neovim Configuration (LazyVim)
This repository contains my personal configuration.

## Features
- **LazyVim:** A starter template for LazyVim to enhance Neovim experience.
- **Norminette Formatter:** Integrated `c_formatter_42` for formatting code according to Norminette standards.
- **Git Integration:** Use `diffview.nvim` for viewing git diffs and file history.
- **Terminal Integration:** Toggle terminal seamlessly using `toggleterm.nvim`.
- **Discord Presence:** Show Neovim activity on Discord using `presence.nvim`.
- **Todo Timer:** Integrated timer for todo list tasks to track time spent on each item.

## Installation
1. **Clone the repository:**
    ```sh
    git clone https://github.com/radouane-tamouss/nvim-config.git ~/.config/nvim
    ```
2. **Install Neovim:**
    Follow the instructions on the [Neovim website](https://neovim.io/) to install the latest version of Neovim.
3. **Install dependencies:**
    Ensure you have the necessary dependencies installed. You can use a package manager like `apt` on Linux:
    ```sh
    sudo apt update
    sudo apt install -y ripgrep fd-find
    ```
4. **Install Norminette formatter:**
    Install the `c_formatter_42` using pip:
    ```sh
    pip install c_formatter_42
    ```
5. **Open Neovim:**
    Launch Neovim to automatically install the required plugins:
    ```sh
    nvim
    ```

## Usage
- **Formatting C Code:**
    - To format a selection of C code, use the keymap `<leader>fc` in visual mode.
    ```lua
    vim.keymap.set("v", "<leader>fc", ":'<,'>!python3 -m c_formatter_42<CR>", {
      desc = "Format C selection with 42 formatter",
      silent = true,
    })
    ```
- **Git Diff View:**
    - Open git diff view with `<leader>gd`.
    ```lua
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" }
    ```
- **Toggle Terminal:**
    - Open terminal with `<c-o>`.
    ```lua
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-o>]],
      direction = "float",
    })
    ```
- **Todo Timer:**
    - Start a timer on a todo item: `<leader>tt` followed by minutes (e.g., `<leader>tt40<Enter>` for 40 minutes)
    - Stop the current timer: `<leader>ts`
    - Commands also available:
        - `:TodoTimer [minutes]` - Start timer (default 25 minutes)
        - `:TodoTimerStop` - Stop current timer
    ```lua
    -- Example todo timer configuration
    {
        dir = vim.fn.expand("~/.config/nvim/lua/custom/todo-timer"),
        name = "todo-timer",
        dev = true,
        config = function()
            require("custom.todo-timer").setup()
        end,
    }
    ```

## Disabling Plugins
To disable a plugin, you can edit the `lazy.lua` file and comment out or remove the specific plugin entry. For example, to disable `presence.nvim`:
```lua
-- { "andweeb/presence.nvim" },
```

Place this configuration in the ~/.config/nvim directory to use it. Check the .config/nvim directory to see what is going on and customize the configuration as per your needs.
