return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")

        toggleterm.setup({
            persist_size = false,
            shade_terminals = true,
            start_in_insert = true,
            direction = "horizontal",
            open_mapping = [[<c-\>]],
        })

        local Terminal = require("toggleterm.terminal").Terminal

        -- Horizontal terminal
        local horizontal_term = Terminal:new({
            direction = "horizontal",
            size = 15,
        })

        local function toggle_horizontal()
            horizontal_term:toggle()
        end

        -- Vertical terminal
        local vertical_term = Terminal:new({
            direction = "vertical",
            size = 30,
            on_open = function()
                vim.cmd("vertical resize 30")
            end,
        })

        local function toggle_vertical()
            vertical_term:toggle()
        end

        -- Floating terminal
        local float_term = Terminal:new({
            direction = "float",
        })

        local function toggle_float()
            float_term:toggle()
        end

        -- Key mappings
        vim.keymap.set("n", "<M-h>", toggle_horizontal, { noremap = true, silent = true })
        vim.keymap.set("n", "<M-v>", toggle_vertical, { noremap = true, silent = true })
        vim.keymap.set("n", "<M-i>", toggle_float, { noremap = true, silent = true })

        vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
    end,
}
