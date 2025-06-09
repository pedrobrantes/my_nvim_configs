`# 🚀 My Neovim Configuration

## ✨ Key Features

* **Plugin Management**: Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast, declarative, and lazy-loaded plugin management.
* **User Interface**:
    * **Theme**: [Gruvbox Material](https://github.com/sainnhe/gruvbox-material).
    * **Statusline**: Informative and beautiful statusline with [Lualine](https://github.com/nvim-lualine/lualine.nvim).
    * **File Explorer**: Intuitive file tree with [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua).
    * **Icons**: Rich icon support from [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) and [mini.icons](https://github.com/echasnovski/mini.icons).
    * **Keymap Hints**: Visual feedback for keybindings with [which-key.nvim](https://github.com/folke/which-key.nvim).
    * **LSP Progress**: UI for LSP progress messages with [fidget.nvim](https://github.com/j-hui/fidget.nvim).
* **Code Intelligence (LSP)**:
    * Full LSP integration via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
    * Easy management of LSPs, Linters, Formatters, and DAPs with [mason.nvim](https://github.com/williamboman/mason.nvim).
* **Completion & Snippets**:
    * Powerful completion engine with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
    * Snippet management with [LuaSnip](https://github.com/L3MON4D3/LuaSnip).
* **Linting & Formatting**:
    * Integration with multiple external linters and formatters via [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim).
* **Fuzzy Finding**:
    * Fast and efficient fuzzy finding with [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
* **Debugging**:
    * A full debugging experience is set up with [nvim-dap](https://github.com/mfussenegger/nvim-dap) and [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui).

## 📋 Prerequisites

-   **Neovim** (v0.10.0+ recommended).
-   A **Nerd Font** installed and configured in your terminal (required for icons to render correctly).
-   **Git** (for `lazy.nvim` and many other plugins).
-   **A C Compiler** (like `gcc`) for `nvim-treesitter` parser compilation.
-   **External tools for Telescope:** `ripgrep` (for live grep) and `fd` (for file finding).
-   **Language Runtimes (optional):** For full LSP/DAP/linting support, the base languages must be installed (e.g., Node.js, Python, Go, Rust, Java, PHP, Julia, etc.).
-   **For WSL:** `win32yank.exe` is required for clipboard integration with Windows (the configuration in `lua/options.lua` is already set up to use it).

## 💾 Installation

1.  If you already have a Neovim configuration, back it up:
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    ```
2.  Clone this repository:
    ```bash
    git clone [https://github.com/PedroBrantes/my_nvim_configs.git](https://github.com/PedroBrantes/my_nvim_configs.git) ~/.config/nvim
    ```

## 🚀 Post-Installation

1.  Launch Neovim with the `nvim` command.
2.  `lazy.nvim` will automatically bootstrap itself and then install all the plugins listed in `lua/plugin_manager.lua`. You can follow the progress in the `lazy.nvim` window.
3.  After the installation is complete, restart Neovim.
4.  Run `:checkhealth` to verify the overall health of your setup and identify any remaining external dependencies.
5.  Run `:Mason` to view the status of all LSPs, DAPs, linters, and formatters, and install any that might be missing.

## ⌨️ Key Mappings

This configuration uses `<space>` as the **Leader** key.

Press `<space>` to open the `which-key` menu and see all available keybinding groups.

#### General & Editing

| Keymap                | Description                                |
| --------------------- | ------------------------------------------ |
| `gcc`                 | Toggle comment for the current line        |
| `gc` + motion         | Toggle comment for the selected region     |
| `<space>w`            | Save file                                  |
| `<space>q` / `<space>Q` | Quit / Quit All                            |
| `<leader>/`           | Clear Search Highlight                     |
| `J` / `K` (Visual)    | Move selected lines down / up              |

#### Window & Buffer Management

| Keymap     | Description                         |
| ---------- | ----------------------------------- |
| `<space>e`  | Toggle file explorer (`NvimTree`)   |
| `ss` / `sv`  | Split window horizontally / vertically |
| `<C-w><C-h/j/k/l>` | Navigate between window splits      |
| `<space>bn` | Next Buffer                         |
| `<space>bp` | Previous Buffer                     |
| `<space>bd` | Close (Delete) Buffer               |

#### Search (Telescope) (`<space>s`)

| Keymap     | Description               |
| ---------- | ------------------------- |
| `<space>f` or `<space>sf` | Find Files                |
| `<space>sw` | Live Grep (search words)  |
| `<space>sk` | Search Keymaps            |
| `<space>sc` | Search Commands           |
| `<space>sh` | Search Help Tags          |

#### LSP Actions (`<space>l`)

| Keymap     | Description               |
| ---------- | ------------------------- |
| `<space>lD` | Go to Definition          |
| `<space>lh` | Hover Documentation       |
| `<space>lr` | Rename Symbol             |
| `<space>lc` | Code Actions              |
| `<space>lf` | Format Buffer             |
| `<space>le` | Show Line Diagnostics     |
| `<space>lj` / `<space>lk` | Next / Previous Diagnostic  |

#### Debugging (DAP) (`<space>d`)

| Keymap     | Description                    |
| ---------- | ------------------------------ |
| `<space>db` | Toggle Breakpoint              |
| `<space>dc` | Continue Execution             |
| `<space>di` | Step Into                      |
| `<space>do` | Step Over                      |
| `<space>dO` | Step Out                       |
| `<space>dr` | Open DAP REPL                  |
| `<space>duo`| Open Debug UI                  |
| `<space>duc`| Close Debug UI                 |

#### Package Management (`<space>p`)

| Keymap     | Description               |
| ---------- | ------------------------- |
| `<space>pp` | Open Mason                |
| `<space>pu` | Update Mason Packages     |`
