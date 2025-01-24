return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
      "jonarrien/telescope-cmdline.nvim",
    },
    tag = "0.1.8",
    config = function()
      local builtin = require("telescope.builtin")
      require("telescope").setup({
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
          cmdline = {
            picker = {
              layout_config = {
                width = 120,
                height = 25,
              },
            },
            mappings = {
              complete = "<TAB>",
              run_selection = "<C-CR>",
              run_input = "<CR>",
            },
            overseer = {
              enabled = false,
            },
          },
        },
      })
      require("telescope").load_extension("fzy_native")
      require("telescope").load_extension("cmdline")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "Q", "<CMD>:Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })
    end,
  },
}
