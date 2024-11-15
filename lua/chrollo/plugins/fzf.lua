return {
  "ibhagwan/fzf-lua",
  dependiencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})
    vim.keymap.set("n", "<leader><leader>", "<CMD>FzfLua buffers<CR>", { silent = true, desc = "Open Buffers" })
    vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files resume=true<CR>", { silent = true, desc = "Open Files" })
    vim.keymap.set("n", "<leader>fs", "<CMD>FzfLua live_grep<CR>", { silent = true, desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua git_files<CR>", { silent = true, desc = "Git Files" })
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('gD', function() require("fzf-lua").lsp_definitions() end, "Goto Definitions")
        map('gr', function() require("fzf-lua").lsp_references() end, "Goto References")
        map('gd', function() require("fzf-lua").lsp_typedefs() end, "Goto Type Definitions")
      end
    })
  end,
}
