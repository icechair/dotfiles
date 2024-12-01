return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    defaults = {},
    spec = {
      {
        mode = { 'n', 'v' },
        {
          '<leader>b',
          group = 'buffer',
          expand = function()
            return require('which-key.extras').expand.bxf()
          end,
        },
        {
          '<leader>w',
          group = 'windows',
          proxy = '<c-w>',
          expand = function()
            return require('which-key.extras').expand.win()
          end,
        },
      },
    },
  },
}
