return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    ensure_installed = {
      "lua_ls",
      "gopls",
      "terraformls",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "j-hui/fidget.nvim"
    },
    lazy = false,
    opts = { lsp = { auto_attach = true } },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      require("fidget").setup({
        notification = { window = { winblend = 0 }, },
      })
      local lspconfig = require("lspconfig")
      lspconfig.html.setup({
        capabilities = capabilities
      })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                  },
                },
              },
            })
          end,

          ["terraformls"] = function()
            lspconfig.terraformls.setup({
              on_init = function(client, _)
                client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
              end,
            })
          end
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP: Go to References" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Actions" })
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP: Rename" })
        end
      })
    end,
  },
  {
    "RRethy/vim-illuminate",
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
        format_on_save = {
          timeout_ms = 500,
          stop_after_first = true,
          lsp_format = "fallback",
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  },
}
