return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.o.relativenumber = true
          end,
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          never_show = {
            ".git",
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>fi", "<CMD>Neotree toggle<CR>", { silent = true, desc = "Toggle Neotree" })
  end,
}
