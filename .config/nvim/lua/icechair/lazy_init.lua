local lp = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lp) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    'https://github.com/folke/lazy.nvim.git',
    lp,
  }
end
vim.opt.rtp:prepend(lp)

local lazy = require 'lazy'
lazy.setup {
  spec = 'icechair.lazy',
  change_detection = { notify = false },
  ui = {
    icons = {},
  },
}
