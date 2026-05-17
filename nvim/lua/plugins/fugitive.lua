return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'Gdiffsplit', 'Gread', 'Gwrite', 'Ggrep', 'GMove', 'GDelete', 'GBrowse' },
  keys = {
    { '<leader>gg', '<cmd>Git<cr>', desc = 'Open Fugitive status' },
    { '<leader>ga', '<cmd>Git add %<cr>', desc = 'Git add current file' },
    { '<leader>gc', '<cmd>Git commit<cr>', desc = 'Git commit' },
    { '<leader>gp', '<cmd>Git push<cr>', desc = 'Git push' },
    { '<leader>gP', '<cmd>Git pull<cr>', desc = 'Git pull' },
    { '<leader>gd', '<cmd>Gdiffsplit<cr>', desc = 'Git diff split' },
    { '<leader>gb', '<cmd>Git blame<cr>', desc = 'Git blame' },
    { '<leader>gl', '<cmd>Git log<cr>', desc = 'Git log' },
	{ '<leader>gA', '<cmd>Git commit --amend --no-edit<cr>', desc = 'Amend last commit (no edit)' },
  },
}
