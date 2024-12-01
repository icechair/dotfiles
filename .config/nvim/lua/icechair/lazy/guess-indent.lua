return {
  'nmac427/guess-indent.nvim',
  config = function()
    require('guess-indent').setup {
      override_editorconfig = true,
    }
  end,
}
