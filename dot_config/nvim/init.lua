require('treesitter')
require('lsp')
require('fzf')

-- Vim Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.clipboard = 'unnamedplus'
vim.g.mapleader = ' '
vim.g.netrw_banner = 0

require('keybinds')

-- Theme
vim.cmd.colorscheme('catppuccin')

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})
