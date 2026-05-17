return {
	'nvim-treesitter/nvim-treesitter',
	config = function()
	require('nvim-treesitter.configs').setup({
	ensure_installed = {"c", "cpp", "lua", "vim", "vimdoc", "python"},
	auto_install = true,
	highlight = {
		enable = true
	},
  	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
      node_incremental = "<leader>ni",
      scope_incremental = "<leader>si",
      node_decremental = "<leader>nd",
    },
  },
})
end
}
