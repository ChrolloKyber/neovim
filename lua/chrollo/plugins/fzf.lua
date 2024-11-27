return {
  "ibhagwan/fzf-lua",
  dependiencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})
    vim.keymap.set("n", "<leader><leader>", "<CMD>FzfLua buffers<CR>", { silent = true, desc = "Open Buffers" })
    vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { silent = true, desc = "Open Files" })
    vim.keymap.set("n", "<leader>fs", "<CMD>FzfLua live_grep<CR>", { silent = true, desc = "Live Grep" })
    vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua git_files<CR>", { silent = true, desc = "Git Files" })
  end,
}
