return {
  {
    "someone-stole-my-name/yaml-companion.nvim",
    ft = { "yaml", "yaml.docker-compose" },
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml", "yaml.docker-compose" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_x = { require("yaml_nvim").get_yaml_key_and_value },
        }
      })
    end
  }
}
