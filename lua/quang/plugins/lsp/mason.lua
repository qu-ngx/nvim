return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install (LSP)
			ensure_installed = {
				-- Rust gigs --
				"rust_analyzer",
				-- Go familia --
				"gopls",
				-- My C familia --
				"clangd",
				-- Web familia --
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"graphql",
				"emmet_ls",
				"prismals",
				-- Lua for nvim --
				"lua_ls",
				-- Python --
				"pyright",
				-- Java --
				"jdtls", -- Java LSP
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Doesn't need clang-tidy since clangd is already installed or come with clangd
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
				"eslint",
			},
			automatic_installation = true,
		})
	end,
}
