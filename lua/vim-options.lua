vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.opt.autoindent = false
vim.opt.smartindent = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

local M = {}

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- navigating
Map({ "n", "t" }, "<C-h>", "<C-w>h")
Map({ "n", "t" }, "<C-l>", "<C-w>l")
Map({ "n", "t" }, "<C-k>", "<C-w>k")
Map({ "n", "t" }, "<C-j>", "<C-w>j")
Map("t", "<C-h>", "<cmd>wincmd h<CR>")
Map("t", "<C-j>", "<cmd>wincmd j<CR>")
Map("t", "<C-k>", "<cmd>wincmd k<CR>")
Map("t", "<C-l>", "<cmd>wincmd l<CR>")

-- resizing
Map("n", "<C-w>", ":resize -2<CR>")
Map("n", "<C-s>", ":resize +2<CR>")
Map("n", "<C-a>", ":vertical resize -2<CR>")
Map("n", "<C-d>", ":vertical resize +2<CR>")

-- terminal
Map("t", "<C-w>", "<cmd>resize -2<CR>")
Map("t", "<C-s>", "<cmd>resize +2<CR>")
Map("t", "<C-a>", "<cmd>vertical resize -2<CR>")
Map("t", "<C-d>", "<cmd>vertical resize +2<CR>")

-- moving blocks of code
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

-- indenting while staying in visual mode
Map("v", "<", "<gv")
Map("v", ">", ">gv")

-- experiment
Map("n", "J", "mzJ`z")
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = 0,
	}
end
M.Map = Map
return M
