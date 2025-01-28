return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require("oil").setup({
        columns = {
          "icon",
          "permission",
          "size",
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            local git = name:match(".git")
            return git ~= nil
          end,
          sort = {
            { "name", "asc" },
          },
        },
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Launch Oil" })
    end,
  },
}
