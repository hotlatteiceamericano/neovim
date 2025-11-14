-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.o.relativenumber = true

-- my custom remaps
vim.keymap.set('n', 'x', '"_x', { desc = 'prevent deleted chars to clipboard' })
vim.keymap.set('n', '<C-S-Tab>', '<cmd>buffer #<cr>', {}) -- not working :(

-- indentations
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- hide the nvim status bar
-- vim.opt.laststatus = 0
