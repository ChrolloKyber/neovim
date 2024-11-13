return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
    end
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,

    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<A-g>", "<CMD>LazyGit<CR>", desc = "LazyGit" }
    }
  }
}
