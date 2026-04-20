return {
  {
    "sainnhe/sonokai",
    init = function()
      vim.opt.termguicolors = true
      vim.api.nvim_set_var("sonokai_style", "shusia")
      vim.cmd("colorscheme sonokai")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      open_mapping = [[<C-\>]],
      direction = "horizontal",
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 1,
    },
    init = function()
      -- Cursed (?) setup for lazygit window
      local Terminal  = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end

      map = vim.api.nvim_set_keymap
      opts = {noremap = true, silent = true}
      map("n", "<leader>g", ":lua _lazygit_toggle()<CR>", opts)
    end,
  },
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", ":Telescope find_files<CR>" },
      { "<C-f>", ":Telescope find_files<CR>" },
      { "<leader>fg", ":Telescope live_grep<CR>" },
      { "<C-g>", ":Telescope live_grep<CR>" },
      { "<leader>fc", ":Telescope grep_string<CR>" },
      { "<leader>fb", ":Telescope buffers<CR>" },
      { "<leader>fh", ":Telescope help_tags<CR>" },
      { "<leader>fd", ":Telescope diagnostics<CR>" },
      { "<leader>fs", ":Telescope lsp_document_symbols<CR>" },
      { "<leader>fS", ":Telescope lsp_workspace_symbols<CR>" },
    },
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
    },
  },
   {
    "stevearc/oil.nvim",
    opts = {},
    lazy = false,
  },
  "sindrets/diffview.nvim",
  { "lewis6991/gitsigns.nvim", opts = {} },
  -- { "lukas-reineke/indent-blankline.nvim", main = 'ibl', opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },
  -- {
  --   "kaarmu/typst.vim",
  --   init = function()
  --     vim.g.typst_pdf_viewer = "zathura"
  --   end
  -- },
  "kaarmu/typst.vim",
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
      ts = require("nvim-treesitter")
      filetypes = {
        "markdown",
        "html",
        "css",
        "javascript",
        "python",
        "toml",
        "json",
        "lua",
        "bash",
        "comment",
        "c",
        "cpp",
        "lua",
        "rust",
        "nix",
        "haskell",
        "typst",
        "gdscript",
      }
      ts.install(filetypes)

      for _, ft in ipairs(filetypes) do
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { ft },
          callback = function ()
            vim.treesitter.start()
          end,
        })
      end
    end,
  },
  {
    'Julian/lean.nvim',
    event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
    },
    opts = {
      mappings = true,
    }
  },
}
