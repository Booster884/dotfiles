require('plugins')

vim.opt.hidden = true
-- vim.opt.backup = false
-- vim.opt.writebackup = false
-- vim.opt.swapfile = false

-- Use tabs for indentation (by default), render tabs four columns wide
vim.opt.expandtab = false
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
-- Theme stuff
vim.opt.termguicolors = true
vim.api.nvim_set_var("sonokai_style", "shusia")
vim.cmd("colorscheme sonokai")
vim.opt.background = "dark"

vim.opt.number = true
vim.opt.scrolloff = 3
vim.opt.list = true
-- vim.opt.showtabline = 2
require("bufferline").setup{}

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.cmd "set whichwrap+=<,>,[,],h,l"

require("toggleterm").setup{
	size = 20,
	open_mapping = [[<C-\>]],
	direction = "horizontal",
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 1,
}

------------------------------------------------------------
-- BINDS
------------------------------------------------------------

vim.g.mapleader = " "

map = vim.api.nvim_set_keymap
opts = {noremap = true, silent = true}

-- Move through windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Move through buffers
-- map("n", "L", ":bn<cr>", opts) 
-- map("n", "H", ":bp<cr>", opts)
map("n", "L", ":BufferLineCycleNext<CR>", opts)
map("n", "H", ":BufferLineCyclePrev<CR>", opts)

-- Stay in visual mode while indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("v", "p", '"_dP', opts) -- Paste without yanking

-- Move text
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- TODO: https://github.com/nvim-telescope/telescope.nvim#usage

-- TODO: create function that runs file most appropriately
-- and map that to <leader>r
-- Alternatively: find plugin that does this.
map("n", "<leader>rp", ":w !python<cr>", opts)

map("n", "<leader>e", ":Lex 30<cr>", opts)

map("n", "<leader>ps", ":PackerSync<cr>", opts)
map("n", "<leader>pq", ":PackerStatus<cr>", opts)
