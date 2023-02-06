require("plugins")
require("lsp")

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

-- Theme stuff
vim.opt.termguicolors = true
vim.api.nvim_set_var("sonokai_style", "shusia")
vim.cmd("colorscheme sonokai")
-- vim.cmd("colorscheme oh-lucy-evening")
vim.opt.background = "dark"

vim.opt.number = true
vim.opt.scrolloff = 3
vim.opt.list = true
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
require("bufferline").setup{}

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.cmd "set whichwrap+=<,>,[,],h,l"

require("toggleterm").setup({
	size = 20,
	open_mapping = [[<C-\>]],
	direction = "horizontal",
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 1,
})

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true,
})

function _lazygit_toggle()
  lazygit:toggle()
end

require("neogit").setup()
require("gitsigns").setup()

require("Comment").setup()

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

-- Slightly dubious lsp binds
map("n", ",", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)

-- Stay in visual mode while indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("v", "p", '"_dP', opts) -- Paste without yanking

-- Move text
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Move through and delete buffers
map("n", "<leader>n", ":BufferLineCycleNext<CR>", opts)
map("n", "<leader>b", ":BufferLineCyclePrev<CR>", opts)
map("n", "<leader>d", ":bd<CR>", opts)

map("n", "<leader>g", ":lua _lazygit_toggle()<CR>", opts)

map("n", "<leader>rp", ":w !python<cr>", opts)

map("n", "<leader>e", ":Lex 20<cr>", opts)

map("n", "<leader>ps", ":PackerSync<cr>", opts)
map("n", "<leader>pq", ":PackerStatus<cr>", opts)

map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
