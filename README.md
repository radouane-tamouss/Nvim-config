# Neovim Configuration

This is my Neovim setup using LazyVim. It works well on macOS.

## How to Install

**Backup your old configuration:**

    ```sh
    mv ~/.config/nvim ~/.config/nvim.bak
    ```

1. **Clone this repo:**

    ```sh
    git clone https://github.com/radouane-tamouss/nvim-config.git ~/.config/nvim
    ```

2. **Install Neovim:**

    Make sure you have Neovim version 0.9.0 or later.

3. **Install plugins:**

    Open Neovim and run:

    ```vim
    :LazySync
    ```

## What's Included

- **File Navigation:** Use [NerdTree](https://github.com/preservim/nerdtree) to browse files.
- **Syntax Highlighting:** Better syntax with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- **Status Line:** Nice status line with [lualine.nvim](https://github.com/hoob3rt/lualine.nvim).
- **Fuzzy Finder:** Quickly find files with [fzf.vim](https://github.com/junegunn/fzf.vim).
- **Git Integration:** Git commands.
- **Terminal Toggle:** Easily toggle terminal with [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim).
- **Markdown Preview:** Preview markdown files.
- **LSP Support:** Language Server Protocol support.

## Key Bindings

Here are some custom key bindings:

- `<Leader>ff`: Open file finder
- `<Leader>fg`: Search for text in files
- `<Leader>fb`: List open buffers
- `<Leader>gs`: Git status
- `<C-o>`: Toggle terminal
...

## Customization

You can change the setup to fit your needs. The main file is `init.lua` in the `~/.config/nvim` folder.

## Contributing

If you have ideas to make this better, open an issue or a pull request.
