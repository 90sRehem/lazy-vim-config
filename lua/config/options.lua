-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.wo.number = true

-- Navigate vim panes better
-- vim.keymap.set("n", "<c-k", ":wincmd k<CR>")
-- vim.keymap.set("n", "<c-j", ":wincmd j<CR>")
-- vim.keymap.set("n", "<c-h", ":wincmd h<CR>")
-- vim.keymap.set("n", "<c-l", ":wincmd l<CR>")
