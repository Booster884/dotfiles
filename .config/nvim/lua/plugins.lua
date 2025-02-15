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
      { "<leader>fb", ":Telescope buffers<CR>" },
      { "<leader>fh", ":Telescope help_tags<CR>" },
      { "<leader>fd", ":Telescope diagnostics<CR>" }
    },
    dependencies = {
      "nvim-telescope/telescope-symbols.nvim",
    },
  },
  "sindrets/diffview.nvim",
  { "lewis6991/gitsigns.nvim", opts = {} },
  -- { "lukas-reineke/indent-blankline.nvim", main = 'ibl', opts = {} },
  { "numToStr/Comment.nvim", opts = {} },
  -- {
  --   "kaarmu/typst.vim",
  --   init = function()
  --     vim.g.typst_pdf_viewer = "zathura"
  --   end
  -- },
  "kaarmu/typst.vim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
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
          "lua",
          "rust",
          "nix",
          "haskell",
          "typst",
        },
        highlight = {
          enable = true
        },
      })
    end,
  },
}
