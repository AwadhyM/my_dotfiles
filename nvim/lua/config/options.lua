vim.g.mapleader = " "

vim.opt.number = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true

    vim.opt_local.list = true
    vim.opt_local.listchars = {
      tab = ">-",
      trail = "~",
      extends = ">",
      precedes = "<",
      nbsp = "␣",
    }
  end,
})


vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999

vim.opt.virtualedit = "block"

vim.opt.termguicolors = true

vim.opt.ignorecase = true -- Search becomes case insensitive by default
vim.opt.smartcase = true -- Search becomes case sensitive if you use a capital letter
