local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("ERROR: nvim-lsp-installer not available. Called from lsp-installer.lua")
	return
end
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
	print("ERROR: lspconfig not available. Called from lsp-installer.lua")
	return
end
local lspconfig_configs_ok, lspconfig_config = pcall(require, "lspconfig/configs")
if not lspconfig_configs_ok then
	print("ERROR: lspconfig/configs not available. Called from lsp-installer.lua")
	return
end

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
local configs = require("lspconfig.configs")

-- -- Server for cpp/c
-- lspconfig.clangd.setup(lsps_opts)
--
-- -- Server for javascript, typescript, react javascript and react typescript.
-- lspconfig.tsserver.setup(lsps_opts)
--
-- -- General diagnostics for most languages
-- lspconfig.diagnosticls.setup(lsps_opts)
--
-- -- Tailwindcss support, shows colors and completion
-- lspconfig.tailwindcss.setup(lsps_opts)
--
-- -- For html kinda of snippets
-- lspconfig.emmet_ls.setup(lsps_opts)
--
-- -- For css, scss and less
-- lspconfig.cssls.setup(lsps_opts)
--
-- -- Python
-- lspconfig.pyright.setup(lsps_opts)
--
-- -- JSON
-- lspconfig.jsonls.setup(lsps_opts)
--
-- LUA
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = require("tomii.lsp.settings.sumneko_lua"),
})

-- Bash
if not lspconfig_config.bash_language_server then
	configs.bash_language_server = {
		default_config = {
			name = "bash-language-server",
			cmd = { "bash-language-server", "start" },
			filetypes = { "sh" },
			root_dir = function()
				return vim.fn.getcwd()
			end,
			-- settings = {},
		},
	}
end
-- require("lspconfig").bash_language_server.setup(lsps_opts)

-- VHDL: Manual add rust_hdl server
if not lspconfig_config.rust_hdl then
	configs.rust_hdl = {
		default_config = {
			cmd = { "vhdl_ls" },
			filetypes = { "vhdl" },
			root_dir = function(fname)
				return lspconfig.util.root_pattern("vhdl_ls.toml")(fname) or vim.fn.getcwd()
			end,
			settings = {},
		},
	}
end
-- require("lspconfig").rust_hdl.setup(lsps_opts)

-- VHDL: hdl_checker
if not lspconfig_config.hdl_checker then
	lspconfig_config.hdl_checker = {
		default_config = {
			cmd = { "hdl_checker", "--lsp" },
			filetypes = { "vhdl", "verilog", "systemverilog" },
			root_dir = function(fname)
				-- will look for the .hdl_checker.config file in parent directory, a
				-- .git directory, or else use the current directory, in that order.
				local util = lspconfig.util
				return util.root_pattern(".hdl_checker.config")(fname)
					or util.find_git_ancestor(fname)
					or util.path.dirname(fname)
			end,
			settings = {},
		},
	}
end
-- require("lspconfig").hdl_checker.setup(lsps_opts)

-- CUSTOM LSPS

-- mlang
-- vim.lsp.start({
--   name = "mlang",
--   cmd = {"/home/tomii/programming/lsp_mlang/run.sh"},
--   filetypes = { "matlab", "octave" },
--   root_dir = vim.fs.dirname(vim.fs.find({'setup.py', 'pyproject.toml'}, { upward = true })[1]),
--   settings = {},
-- })

-- mason-lspconfig allows me to automatically configure all installed LPSs
-- Though the configs must exists in the lspconfig.
require("mason-lspconfig").setup_handlers({
	function(server_name) -- default handler (optional)
		lspconfig[server_name].setup(lsps_opts)
	end,
})
