return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    defaults = {},
    spec = {
      {
        mode = { 'n', 'v' },
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
