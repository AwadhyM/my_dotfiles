return {
    'nvim-telescope/telescope.nvim', tag = '4.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        require('telescope').setup{
            defaults = {
                prompt_prefix = "$ ",
            },
        }

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
        vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>gs",function() builtin.grep_string({ search = vim.fn.input("Grep > ")}); end)local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
        vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
        vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, {})

        require('telescope').load_extension('fzf')
    end,
}
