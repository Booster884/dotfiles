require('plugins')

local set = vim.opt

set.hidden = true
set.autochdir = true

-- Use tabs for indentation (by default), render tabs four columns wide
set.expandtab = false
set.softtabstop = 4
set.shiftwidth = 4
set.tabstop = 4

-- Weird way to set the theme
vim.cmd("colorscheme jellybeans")
set.number = true
set.scrolloff = 3
set.list = true
set.listchars = "tab:│ "

set.clipboard = "unnamedplus"
set.mouse = "a"

------------------------------------------------------------
-- BINDS
------------------------------------------------------------

vim.g.mapleader = " "

map = vim.api.nvim_set_keymap
opts = {silent = true}

-- TODO: https://github.com/nvim-telescope/telescope.nvim#usage

-- TODO: create function that runs file most appropriately
-- and map that to <leader>r
-- Alternatively: find plugin that does this.
map("n", "<leader>rp", ":w !python<cr>", opts)

map("n", "<leader>n", ":bn<cr>", opts)
map("n", "<leader>p", ":bp<cr>", opts)
map("n", "<leader>d", ":bd<cr>", opts)

map("n", "<leader>ps", ":PackerSync<cr>", opts)
map("n", "<leader>pq", ":PackerStatus<cr>", opts)
