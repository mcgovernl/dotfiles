vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

local languages = {
	'bash',
	'css',
	'dockerfile',
	'graphql',
	'html',
	'javascript',
	'lua',
	'markdown',
	'python',
	'toml',
	'typescript',
	'yaml'
}

require('nvim-treesitter').install(languages)

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            vim.cmd("TSUpdate")
        end
    end,
})

-- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- vim.wo[0][0].foldmethod = 'expr'
-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
