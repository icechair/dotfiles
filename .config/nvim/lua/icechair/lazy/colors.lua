return {
  'theacodes/witchhazel',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme 'witchhazel-hypercolor'
    -- vim.cmd.hi 'Comment gui=none'
  end,
}
