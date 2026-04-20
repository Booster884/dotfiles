return {
  {
    "neovim/nvim-lspconfig",
    init = function()

      local configs = {
        clangd = {},
        pyright = {},
        rust_analyzer = {},
        ts_ls = {},
        hls = {
          capabilities = capabilities,
          filetypes = { 'haskell', 'lhaskell', 'cabal' },
          settings = {
            haskell = {
              formattingProvider = "ormolu",
              plugin = {
                rename = { config = { crossModule = true }},
              },
            },
          },
        },
        tinymist = {},
        ocamllsp = {},
        gdscript = {},
        zls = {},
      }

      for server, config in pairs(configs) do
        -- vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path"
    },
    init = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, {"i", "s"}),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, {"i", "s"}),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "path" },
          { name = "buffer" },
        }),
      })
    end
  }
}
