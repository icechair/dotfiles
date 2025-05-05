return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    { 'folke/neodev.nvim', opts = {} },
  },
  opts = { autoformat = false },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('icechair-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        local telescope = require 'telescope.builtin'
        map('gd', telescope.lsp_definitions, '[g]oto [d]efinition')
        map('gr', telescope.lsp_references, '[g]oto [r]eferences')
        map('gI', telescope.lsp_implementations, '[g]oto [I]implementation')
        map('<leader>D', telescope.lsp_type_definitions, 'type [D]efinition')
        map('<leader>ds', telescope.lsp_document_symbols, '[d]ocument [s]ymbols')
        map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[w]orkspace [s]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ction')
        map('K', vim.lsp.buf.hover, 'hover do[K]umentation')
        map('gD', vim.lsp.buf.declaration, '[g]oto [D]eclaration')

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('icechair-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('icechair-lsp-detach', { clear = true }),
            callback = function(ev2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds {
                group = 'icechair-lsp-highlight',
                buffer = ev2.buf,
              }
            end,
          })
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[t]oggle inlay [h]ints')
        end
      end,
    })
    local cmp_lsp = require 'cmp_nvim_lsp'

    local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    local servers = {
      ts_ls = {},
      goimports = {},
      gofumpt = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            directoryFilters = { '-.git', '-.vscode', '-node_modules' },
          },
        },
      },
      clangd = {
        cmd = {
          'clangd',
          '--background-index',
          '--header-insertion=iwyu',
          '--clang-tidy',
          --         '--query-driver=/**/arm-none-eabi-g*,/**/bin/g*,/**/riscv32-none-eabi-g*',
        },
      },
      zls = {},
      pylsp = {},
      pyright = {},
      cmake = {
        filetypes = { 'cmake', 'CMakeLists.txt' },
      },
      lua_ls = {
        setttings = {
          Lua = {
            runtime = { version = 'Lua 5.1' },
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = {
              globals = {
                'bit',
                'vim',
                'it',
                'describe',
                'before_each',
                'after_each',
              },
            },
          },
        },
      },
    }
    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_installation = {},
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    vim.diagnostic.config {
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }
  end,
}
