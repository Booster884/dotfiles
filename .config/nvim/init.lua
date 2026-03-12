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
vim.opt.relativenumber = true
vim.opt.scrolloff = 3
vim.opt.list = true
vim.opt.colorcolumn = "80"
-- vim.opt.textwidth = 80
vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

two_space_indent_fes = {
  "lua",
  "nix",
  "haskell",
  "ocaml",
  "lean",
}

for _, extension in ipairs(two_space_indent_fes) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = extension,
    callback = function ()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
    end
  })
end

-- Highlight yanked region for a brief period
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", {}),
  desc = "Hightlight selection on yank",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "DiffChange", timeout = 100 }
  end,
})

-- Mappings

vim.g.mapleader = " "
map = vim.api.nvim_set_keymap
opts = {noremap = true, silent = true}

vim.filetype.add {
  extension = {
    cvc = "civic",
  }
}

-- Hard mode
for _, mode in ipairs({"n", "i", "v"}) do
  map(mode, "<Up>", "<Nop>", opts)
  map(mode, "<Down>", "<Nop>", opts)
  map(mode, "<Left>", "<Nop>", opts)
  map(mode, "<Right>", "<Nop>", opts)
end

-- LSP
map("n", ",", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>w", ":lua vim.diagnostic.open_float()<CR>", opts)
map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>lf", ":lua vim.lsp.buf.format()<CR>", opts)
map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
map("n", "gd", ":Telescope lsp_definitions<CR>", opts)
map("n", "gt", ":Telescope lsp_type_definitions<CR>", opts)
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

-- Godot stuff

-- paths to check for project.godot file
local paths_to_check = {'/', '/../'}
local is_godot_project = false
local godot_project_path = ''
local cwd = vim.fn.getcwd()

-- iterate over paths and check
for key, value in pairs(paths_to_check) do
    if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
        is_godot_project = true
        godot_project_path = cwd .. value
        break
    end
end

-- check if server is already running in godot project path
local is_server_running = vim.uv.fs_stat(godot_project_path .. '/server.pipe')
-- start server, if not already running
if is_godot_project and not is_server_running then
    vim.fn.serverstart(godot_project_path .. '/server.pipe')
end

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
