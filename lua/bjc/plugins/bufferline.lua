return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',
  keys = {
    -- { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    -- { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    -- { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    -- { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    -- { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    -- { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<C-S-Tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<C-Tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    -- { '[B', '<cmd>BufferLineMovePrev<cr>', desc = 'Move buffer prev' },
    -- { ']B', '<cmd>BufferLineMoveNext<cr>', desc = 'Move buffer next' },
  },
  opts = {
    options = {
        -- stylua: ignore
        -- close_command = function(n) Snacks.bufdelete(n) end,
        -- stylua: ignore
        -- right_mouse_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      -- diagnostics_indicator = function(_, _, diag)
      --   local icons = LazyVim.config.icons.diagnostics
      --   local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
      --   return vim.trim(ret)
      -- end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
        {
          filetype = 'snacks_layout_box',
        },
      },
      sort_by = function(buffer_a, buffer_b)
        -- add custom logic
        local modified_a = vim.fn.getftime(buffer_a.path)
        local modified_b = vim.fn.getftime(buffer_b.path)
        return modified_a > modified_b
      end,
      -- get_element_icon = function(opts)
      --   return LazyVim.config.icons.ft[opts.filetype]
      -- end,
      -- Next buffer
      vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', { noremap = true, silent = true }),
      -- Previous buffer (works only if your terminal supports it)
      vim.keymap.set('n', '<C-S-Tab>', ':bprevious<CR>', { noremap = true, silent = true }),
    },
  },
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {}
  end,
}
