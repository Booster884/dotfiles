return {
 --  	use "neovim/nvim-lspconfig"
  {
    "neovim/nvim-lspconfig",
    init = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })

      lspconfig.hls.setup({
        capabilities = capabilities,
        settings = {
          haskell = {
            formattingProvider = "fourmolu",
          },
        },
      })

      lspconfig.tinymist.setup({
          capabilities = capabilities,
      })

      lspconfig.ocamllsp.setup({
          capabilities = capabilities,
      })

      local server_config = require("lspconfig.configs")
      local root_pattern = require("lspconfig.util").root_pattern

      server_config.coconut = {
        default_config = {
          -- cmd = { "/home/booster/dev/coconut-ls/dist-newstyle/build/x86_64-linux/ghc-9.8.4/coconut-ls-0.1.0.0/x/coconut-ls/build/coconut-ls/coconut-ls" },
          cmd = { "/home/booster/dev/ccn-ls/target/debug/ccn-ls" },
          name = "coconut",
          filetypes = {
            "coconut",
          },
          -- root_dir = function(fname)
          --   return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
          -- end,
          single_file_support = true,
        }
      }

      lspconfig.coconut.setup({
        on_attach = function(client)
          vim.lsp.set_log_level("INFO")
        end
      })
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
