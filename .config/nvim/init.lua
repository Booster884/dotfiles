vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Use four spaces for indentation (by default)
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.list = true
vim.opt.colorcolumn = "80"
-- vim.opt.textwidth = 80
vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

-- Mappings

vim.g.mapleader = " "
map = vim.api.nvim_set_keymap
opts = {noremap = true, silent = true}

-- LSP
map("n", ",", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "ga", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gr", ":Telescope lsp_references<CR>", opts)


-- Move through windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Stay in visual mode while indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Move through and delete tabs
map("n", "<leader>n", ":tabn<CR>", opts)
map("n", "<leader>b", ":tabp<CR>", opts)
map("n", "<leader>d", ":tabclose<CR>", opts)

-- Lazy.nvim
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
require("lazy").setup({
  { import = "plugins" },
  { import = "lsp" },
}, {
  change_detection = {
    enabled = false,
  },
})
