local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- Import options from the other files
local on_attach = require("tomii.lsp.handlers").on_attach
local capabilities = require("tomii.lsp.handlers").capabilities

-- Register a handler that will be called for all installed servers.
lsp_installer.setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

-- Error that throws clangd
capabilities.offsetEncoding = "utf-8"

-- Define locallly the lsp
local lsps_opts = { on_attach = on_attach, capabilities = capabilities }

-- Server for cpp/c
lspconfig.clangd.setup(lsps_opts)

-- Server for javascript, typescript, react javascript and react typescript.
lspconfig.tsserver.setup(lsps_opts)

-- General diagnostics for most languages
lspconfig.diagnosticls.setup(lsps_opts)

-- Tailwindcss support, shows colors and completion
lspconfig.tailwindcss.setup(lsps_opts)

-- For html kinda of snippets
lspconfig.emmet_ls.setup(lsps_opts)

-- For css, scss and less
lspconfig.cssls.setup(lsps_opts)

-- Python
lspconfig.pyright.setup(lsps_opts)

-- JSON
lspconfig.jsonls.setup(lsps_opts)

-- LUA
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("tomii.lsp.settings.sumneko_lua"),
})

-- CUSTOM LSPS
lspconfig.rust_hdl.setup(lsps_opts)
lspconfig.bash_language_server.setup(lsps_opts)
lspconfig.hdl_checker.setup(lsps_opts)

-- mason-lspconfig allows me to automatically configure all installed LPSs
-- Though the configs must exists in the lspconfig.
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup(lsps_opts)
	end,
})
