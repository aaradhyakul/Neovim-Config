return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false, 
  opts = {
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        }
      }
    })
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle right<CR>', {})
    vim.keymap.set({'n', 't'}, '<C-h>', '<C-w>h')
    vim.keymap.set({'n', 't'}, '<C-l>', '<C-w>l')
    vim.keymap.set({'n', 't'}, '<C-k>', '<C-w>k')
    vim.keymap.set({'n', 't'}, '<C-j>', '<C-w>j')
  end
}
