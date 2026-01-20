return {
  { 'mason-org/mason.nvim', opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    config = function()
      require('mason-lspconfig').setup { ensure_installed = { 'lua_ls', 'rust_analyzer', 'ts_ls' } }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
    },
    config = function()
      -- local lspconfig = require 'lspconfig'
      -- lspconfig.lua_ls.setup {}
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- languages
      vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        capabilities = capabilities,
        settings = {
          Lua = {
            completion = { callSnippet = 'Replace' },
            diagnostics = { globals = { 'vim' } },
          },
        },
      }

      vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
      }

      vim.lsp.config.ts_ls = { capabilities = capabilities }

      -- Diagnostic keymaps
      vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic quickfix list' })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- keymaps
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover {
          border = {
            { '╭', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╮', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '╯', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '╰', 'FloatBorder' },
            { '│', 'FloatBorder' },
          },
        }
      end, { desc = 'Hover' })
      vim.keymap.set('n', '<leader>gK', vim.lsp.buf.signature_help, { desc = 'Signature Help' })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = '[G]o to [D]efeinition' })
      -- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = '[G]o to [R]eference' })
      vim.keymap.set('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', { desc = '[G]o to [R]eference' })
      vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, { desc = '[G]o to [S]ignature' })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
      --
    end,
  },
  -- {
  --   'folke/trouble.nvim',
  --   cmd = { 'Trouble' },
  --   opts = {
  --     modes = {
  --       lsp = {
  --         win = { position = 'right' },
  --       },
  --     },
  --   },
  --   keys = {
  --     { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
  --     { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
  --     { '<leader>cs', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
  --     { '<leader>cS', '<cmd>Trouble lsp toggle<cr>', desc = 'LSP references/definitions/... (Trouble)' },
  --     { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
  --     { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
  --     {
  --       '[q',
  --       function()
  --         if require('trouble').is_open() then
  --           require('trouble').prev { skip_groups = true, jump = true }
  --         else
  --           local ok, err = pcall(vim.cmd.cprev)
  --           if not ok then
  --             vim.notify(err, vim.log.levels.ERROR)
  --           end
  --         end
  --       end,
  --       desc = 'Previous Trouble/Quickfix Item',
  --     },
  --     {
  --       ']q',
  --       function()
  --         if require('trouble').is_open() then
  --           require('trouble').next { skip_groups = true, jump = true }
  --         else
  --           local ok, err = pcall(vim.cmd.cnext)
  --           if not ok then
  --             vim.notify(err, vim.log.levels.ERROR)
  --           end
  --         end
  --       end,
  --       desc = 'Next Trouble/Quickfix Item',
  --     },
  --   },
  -- },
}
