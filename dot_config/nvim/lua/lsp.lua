vim.pack.add{
  'https://github.com/neovim/nvim-lspconfig',
}

local language_servers = {
	'lua_ls',
	'tsc'
}

vim.lsp.enable(language_servers)
