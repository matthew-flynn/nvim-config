return {
	{ "Hoffs/omnisharp-extended-lsp.nvim" },
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "C:/Users/Matt.Flynn/AppData/Roaming/npm/node_modules/@vue/typescript-plugin",
							languages = { "javascript", "typescript", "vue" },
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
			})

			lspconfig.gopls.setup({
				capabilities = capabilities,
			})

			lspconfig.volar.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					-- Disable Volar formatting so null-ls (Prettier) can take over
					client.server_capabilities.documentFormattingProvider = false
				end,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				cmd = {
					"dotnet",
					"C:/Users/Matt.Flynn/AppData/Local/nvim-data/mason/packages/omnisharp/libexec/OmniSharp.dll",
				},
				enable_import_completion = true,
				organize_imports_on_format = true,
				enable_roslyn_analyzers = true,
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").definition_handler,
					["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
					["textDocument/references"] = require("omnisharp_extended").references_handler,
					["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
				},
				root_dir = function()
					return vim.loop.cwd() -- current working directory
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {})
		end,
	},
}
