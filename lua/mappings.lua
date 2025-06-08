local map = vim.keymap.set

-- Global
map('n', 'ss', '<cmd>split<cr>', { desc = "Window: Split Horizontal" })
map('n', 'sv', '<cmd>vsplit<cr>', { desc = "Window: Split Vertical" })

local wk_mappings = {
  -- Direct Commands
  { "<space>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer: Toggle NvimTree" },
  { "<space>f", "<cmd>Telescope find_files<cr>", desc = "Find: Files (Telescope)" },
  { "<space>q", "<cmd>quit<cr>", desc = "Quit Neovim" },
  { "<space>Q", "<cmd>quitall<cr>", desc = "Quit All (Exit Neovim)" },
  { "<space>w", "<cmd>update<cr>", desc = "File: Save (Write)" },

  -- Search Group (s)
  { "<space>s", group = "Search (Telescope)" },
  { "<space>sf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  { "<space>sw", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (Words)" },
  { "<space>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<space>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  { "<space>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },

  -- Package Manager Group (p)
  { "<space>p", group = "Package Manager (Mason)" },
  { "<space>pp", "<cmd>Mason<cr>", desc = "Open Package Manager" },
  { "<space>pu", "<cmd>MasonUpdate<cr>", desc = "Update Packages" },
  -- { "<space>pd", "<cmd>MasonUninstallALl<cr>", desc = "Uninstall All Packages" }, -- This was commented out in your original

  -- Debug (DAP) Group (d)
  { "<space>d", group = "Debug (DAP)" },
  { "<space>db", function() require('dap').toggle_breakpoint() end, desc = "Toggle Breakpoint" },
  { "<space>dc", function() require('dap').continue() end, desc = "Continue" },
  { "<space>di", function() require('dap').step_into() end, desc = "Step Into" },
  { "<space>do", function() require('dap').step_over() end, desc = "Step Over" },
  { "<space>dO", function() require('dap').step_out() end, desc = "Step Out" },
  { "<space>dr", function() require('dap').repl.open() end, desc = "Open REPL" },
  { "<space>dl", function() require('dap').run_last() end, desc = "Run Last" },
  { "<space>dt", function() require('dap').terminate() end, desc = "Terminate" },
  { "<space>dk", function() require('dap').up() end, desc = "Frame Up" },
  { "<space>dj", function() require('dap').down() end, desc = "Frame Down" },

  -- DAP UI Sub-Group (du, under Debug group)
  { "<space>du", group = "UI (DAP UI)" },
  { "<space>duo", function() require('dapui').open() end, desc = "Open UI" },
  { "<space>duc", function() require('dapui').close() end, desc = "Close UI" },
  { "<space>dut", function() require('dapui').toggle() end, desc = "Toggle UI" },
  { "<space>due", function() require('dapui').eval() end, desc = "Eval Expression" },

  -- LSP Group (l)
  { "<space>l", group = "LSP Actions" },
  { "<space>lD", function() vim.lsp.buf.definition() end, desc = "Go to Definition" },
  { "<space>ld", function() vim.lsp.buf.declaration() end, desc = "Go to Declaration" },
  { "<space>li", function() vim.lsp.buf.implementation() end, desc = "Go to Implementation" },
  { "<space>lt", function() vim.lsp.buf.type_definition() end, desc = "Type Definition" },
  { "<space>ls", function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
  { "<space>lr", function() vim.lsp.buf.rename() end, desc = "Rename" },
  { "<space>lh", function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
  { "<space>lc", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
  { "<space>lf", function() vim.lsp.buf.format { async = true } end, desc = "Format Buffer" },
  { "<space>le", function() vim.diagnostic.open_float() end, desc = "Show Line Diagnostics" },
  { "<space>lj", function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic" }, -- lj para "jump"
  { "<space>lk", function() vim.diagnostic.goto_prev() end, desc = "Previous Diagnostic" }, -- lk para "jump"
  { "<space>lq", function() vim.diagnostic.setloclist() end, desc = "Diagnostics Quickfix" },
}

return wk_mappings
