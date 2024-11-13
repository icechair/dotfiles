-- <leader> to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- open directory of active buffer
vim.keymap.set("n", "<leader>fq", vim.cmd.Ex)

vim.keymap.set('n', '<leader>b', function()
    vim.o.list = not vim.o.list
end, { desc = 'toggle whitespaces' })
