return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require('render-markdown').setup {
      render_modes = { 'n', 'c', 't' },
    }
  end,
  keys = {
    { '<leader>mp', '<cmd>RenderMarkdown preview<CR>', desc = 'Render markdown preview' },
  },
}
