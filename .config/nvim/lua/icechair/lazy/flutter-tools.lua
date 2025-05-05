return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local ft = require 'flutter-tools'
    ft.setup {}
  end,
}
