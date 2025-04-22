-- lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup{}
    vim.opt.termguicolors = true
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>x', ':bd<CR>', {noremap = true, silent = true})
  end,
}

