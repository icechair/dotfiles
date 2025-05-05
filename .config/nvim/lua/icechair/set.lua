vim.opt.guicursor = ''
vim.opt.mouse = ''

-- indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true

-- history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

-- whitespaces
vim.opt.list = false
---@diagnostic disable-next-line: missing-fields
vim.opt.listchars = { space = '␣', tab = '» ', trail = '·', nbsp = '‿', eol = '⮠' }

-- truecolor
vim.opt.termguicolors = true

-- linenumbers
vim.opt.number = true
vim.opt.relativenumber = true
-- signs in number column?
-- vim.opt.signcolumn = 'number'
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '100'
vim.opt.cursorline = true

-- update time/sequence times
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- keep x lines visible
vim.opt.scrolloff = 10
-- reload buffer on external change?
vim.opt.autoread = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
