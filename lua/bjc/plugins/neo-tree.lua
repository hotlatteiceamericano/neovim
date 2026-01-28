return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    -- keys = {
    --   '<C-n>',
    --   -- mode = { 'n' },
    --   ':Neotree toggle<CR>',
    --   desc = 'Toggle Neotree',
    -- },
    config = function()
      vim.keymap.set('n', '\\\\', ':Neotree toggle<CR>', { desc = 'Toggle Neotree' })
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visitble = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        use_libuv_file_watcher = true, -- Auto-refresh on file changes
      }
    end,
  },
}
