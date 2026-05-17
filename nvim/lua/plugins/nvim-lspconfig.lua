return {
	'neovim/nvim-lspconfig',
	config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig.clangd.setup({ capabilities = capabilities})
		lspconfig.pyright.setup({ capabilities = capabilities})
		lspconfig.tsserver.setup({capabilities = capabilities})
		lspconfig.lua_ls.setup({ capabilities = capabilities,
			settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
		})
	end,

	-- Mappings for lsp
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {}),
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}),
	vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, {}),
	vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {}),
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {}),
	vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_next, {}),
}

