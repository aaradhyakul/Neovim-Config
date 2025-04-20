return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    --ensure_installed = {"lua", "cpp", "c" , "python"},
    highlight = {enable = true},
    indent = {enable = true},
    auto_install = true,
  },
  config = function(_, opts)
    local config = require("nvim-treesitter.configs")
    config.setup(opts)
  end
}
