-- lua/plugins/bufferline.lua
local vim_opts = require("vim-options")

return {
    "akinsho/bufferline.nvim",  
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({})
        vim.opt.termguicolors = true
        vim_opts.Map("n", "<Tab>", ":bn<CR>")
        vim_opts.Map("n", "<S-Tab>", ":bp<CR>")
        vim_opts.Map("n", "<Leader>bd", ":bd<CR>")
    end,
}
