local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require "config.options" -- Load the contents of the options file that is located in lua/options
require "config.mappings"

vim.cmd "set relativenumber"
require("lazy").setup("plugins")
vim.cmd [[colorscheme github_dark]]
