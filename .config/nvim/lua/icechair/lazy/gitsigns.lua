return {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    'folke/trouble.nvim',
  },
  config = function()
    local gs = require 'gitsigns'
    gs.setup {
      on_attach = function(bufnr)
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end
        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.norma { ']c', bang = true }
          else
            gs.nav_hunk 'next'
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.norma { '[c', bang = true }
          else
            gs.nav_hunk 'prev'
          end
        end)

        -- Actions
        map('n', '<leader>gs', gs.stage_hunk, { desc = '[g]it [s]tage hunk' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = '[git] [r]eset hunk' })
        map('v', '<leader>gs', function()
          gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[g]it [s]tage block' })
        map('n', '<leader>gr', function()
          gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[git] [r]eset block' })

        map('n', '<leader>gS', gs.stage_hunk, { desc = '[g]it [S]tage buffer' })
        map('n', '<leader>gR', gs.reset_hunk, { desc = '[git] [R]eset buffer' })
        map('n', '<leader>gp', gs.preview_hunk, { desc = '[git] [p]review hunk' })
        map('n', '<leader>gi', gs.preview_hunk, { desc = '[git] preview [i]nline hunk' })

        map('n', '<leader>gb', function()
          gs.blame_line { full = true }
        end, { desc = '[git] [b]lame line' })

        -- Toggles
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = '[g]it [t]oggle [b]lame' })
      end,
    }
  end,
}
