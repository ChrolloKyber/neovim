vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<leader>pv', '<CMD>Ex<CR>', { silent = true, desc = "Launch Netrw" })
vim.keymap.set('n', '<ESC>', 'set nohlsearch', { silent = true, desc = "Clear search highlight" })
vim.keymap.set('n', '<C-`>', 'split term://zsh', { silent = true, desc = "Launch terminal at bottom" })
