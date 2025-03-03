local env = require 'icechair.llm_config'
return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    --    'github/copilot.vim',
  },
  config = function()
    local cc = require 'codecompanion'
    cc.setup {
      adapters = {
        deepseek = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = env,
          })
        end,
      },
      strategies = {
        chat = { adapter = 'deepseek' },
        --      inline = { adapter = 'copilot' },
        agent = { adapter = 'deepseek' },
      },
    }

    vim.keymap.set({ 'n', 'v' }, '<C-a>', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    vim.keymap.set({ 'n', 'v' }, '<leader>cc', '<cmd>CodeCompanionChat toggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('v', 'ga', '<cmd>CodeCompanionChat add<cr>', { noremap = true, silent = true })
    vim.cmd [[cab cc CodeCompanion]]
  end,
}
