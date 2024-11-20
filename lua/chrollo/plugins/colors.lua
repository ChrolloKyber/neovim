return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      overrides = {
        SignColumn = { bg = "#1E2122" }
      }
    })
    vim.cmd.colorscheme("gruvbox")
  end,
}
