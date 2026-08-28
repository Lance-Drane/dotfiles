-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.expandtab = false -- override this with editorconfig 'indent_style' setting
opt.scrolloff = 4 -- when scrolling full page, how many lines to leave above/below
opt.shiftwidth = 4
opt.swapfile = false
opt.tabstop = 8

vim.g.lazyvim_python_lsp = "basedpyright"
--vim.g.lazyvim_python_lsp = "ty"
