local lazy = require("lazy")

local plugins = {
	{
		"j-hui/fidget.nvim",
	},
	{
		"folke/neodev.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"windwp/nvim-autopairs",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local tree = require("nvim-tree")

			tree.setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"nvimtools/none-ls.nvim",
	},
	{
		"nvim-lualine/lualine.nvim",
	},
	{
		"sainnhe/gruvbox-material",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				config = function()

					local dap_packages_ok, dap_packages_list = pcall(require, "debuggers")
					local ensure_installed_daps = {}

					if dap_packages_ok and type(dap_packages_list) == "table" then
						ensure_installed_daps = dap_packages_list
					else
						print(
							"Erro ao carregar lua/debuggers.lua ou não é uma tabela. Lista de DAPs para mason-nvim-dap estará vazia."
						)
						if not dap_packages_ok then
							print("Detalhe do erro: " .. tostring(dap_packages_list))
						end
					end

					require("mason-nvim-dap").setup({
						ensure_installed = ensure_installed_daps,
						handlers = {
						},
						automatic_installation = true,
					})
				end,
			},
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"mfussenegger/nvim-dap",
					"nvim-neotest/nvim-nio",
				},
				config = function()
					local dapui = require("dapui")
					dapui.setup({
					})

					local dap = require("dap")
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},
		},
		config = function()
			local dap = require("dap")
			vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapBreakpointCondition", { text = "🛑", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapLogPoint", { text = "📖", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
		end,
	},
	{
		"echasnovski/mini.icons",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		lazy = false,
		opts = function()
			local my_mappings_list_status, my_mappings_list = pcall(require, "mappings")

			if not my_mappings_list_status then
				return { spec = {} }
			end

			if type(my_mappings_list) ~= "table" then
				return { spec = {} }
			end

			return {
				spec = my_mappings_list,
				win = {
					border = "single",
				},
				plugins = {
					marks = true,
					registers = true,
					spelling = { enabled = true },
					presets = {
						operators = true,
						motions = true,
						text_objects = true,
						windows = true,
						nav = true,
						z = true,
						g = true,
					},
				},
				triggers = {
					{ "<auto>", mode = "nxso" },
				},
				notify = true,
				delay = 200,
			}
		end,
	},
}

lazy.setup(plugins)
