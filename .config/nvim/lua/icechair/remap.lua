-- <leader> to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- open directory of active buffer
vim.keymap.set("n", "<leader>fq", vim.cmd.Ex)

vim.keymap.set('n', '<leader>b', function()
    vim.o.list = not vim.o.list
end, { desc = 'toggle whitespaces' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
