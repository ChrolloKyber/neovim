return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { silent = true, desc = "Tag files to Harpoon" })
    vim.keymap.set("n", "<leader>hi", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = "Harpoon Open Quick Menu" })
    vim.keymap.set("n", "<C-z>", function()
      harpoon:list():select(1)
    end, { silent = true, desc = "Harpoon Goto File 1" })
    vim.keymap.set("n", "<C-x>", function()
      harpoon:list():select(2)
    end, { silent = true, desc = "Harpoon Goto File 2" })
    vim.keymap.set("n", "<C-c>", function()
      harpoon:list():select(3)
    end, { silent = true, desc = "Harpoon Goto File 3" })
    vim.keymap.set("n", "<C-v>", function()
      harpoon:list():select(4)
    end, { silent = true, desc = "Harpoon Goto File 4" })
    vim.keymap.set("n", "<C-y>", function()
      harpoon:list():prev()
    end, { silent = true, desc = "Harpoon Previous File" })
    vim.keymap.set("n", "<C-u>", function()
      harpoon:list():next()
    end, { silent = true, desc = "Harpoon Next File" })
  end,
}
