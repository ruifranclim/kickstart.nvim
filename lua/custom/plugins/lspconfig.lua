
return {
	'neovim/nvim-lspconfig',
	config = function()
		-- Setup Mason to automatically install LSP servers
		require('mason').setup({
			ui = {
				height = 0.8,
			},
		})
		require('mason-lspconfig').setup({ automatic_installation = true })

		local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- PHP
		require('lspconfig').intelephense.setup({
			commands = {
				IntelephenseIndex = {
					function()
						vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
					end,
				},
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
				-- if client.server_capabilities.inlayHintProvider then
				--   vim.lsp.buf.inlay_hint(bufnr, true)
				-- end
			end,
			capabilities = capabilities
		})

		require('lspconfig').phpactor.setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				client.server_capabilities.completionProvider = false
				client.server_capabilities.hoverProvider = false
				client.server_capabilities.implementationProvider = false
				client.server_capabilities.referencesProvider = false
				client.server_capabilities.renameProvider = false
				client.server_capabilities.selectionRangeProvider = false
				client.server_capabilities.signatureHelpProvider = false
				client.server_capabilities.typeDefinitionProvider = false
				client.server_capabilities.workspaceSymbolProvider = false
				client.server_capabilities.definitionProvider = false
				client.server_capabilities.documentHighlightProvider = false
				client.server_capabilities.documentSymbolProvider = false
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			init_options = {
				["language_server_phpstan.enabled"] = false,
				["language_server_psalm.enabled"] = false,
			},
			handlers = {
				['textDocument/publishDiagnostics'] = function() end
			}
		})
	end,
}
