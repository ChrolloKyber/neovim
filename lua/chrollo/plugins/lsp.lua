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
      "j-hui/fidget.nvim",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    lazy = false,
    opts = { lsp = { auto_attach = true } },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("fidget").setup({
        notification = { window = { winblend = 0 } },
      })
      local lspconfig = require("lspconfig")
      lspconfig.html.setup({
        capabilities = capabilities,
      })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
            })
          end,
        },
      })

      lspconfig.terraformls.setup({
        cmd = { "terraform-ls", "serve", "-log-file", "/dev/null" },
        on_init = function(client, _)
          client.server_capabilities.semanticTokensProvider = nil -- turn off semantic tokens
        end,
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover" })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to Definition" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: Go to Declaration" })
          vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: Go to References" })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Actions" })
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP: Rename" })
          vim.keymap.set("n", "<A-n>", "<CMD>Navbuddy<CR>", { desc = "LSP: Launch Navbuddy" })
        end,
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
          json = { "prettier" },
          python = { "ruff_format" },
          terraform = { "terraform_fmt" },
          markdown = { "prettier", "cbfmt" },
        },
        format_on_save = {
          timeout_ms = 500,
          stop_after_first = false,
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
    end,
  },
}
