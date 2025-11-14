return {
  'folke/flash.nvim',
  lazy = false,
  priority = 1000,
  -- event = 'VimEnter',
  config = function()
    -- dont understand why it needs to call setup function to load the plugin
    require('flash').setup()
  end,
  -- keys = {
  --   {
  --     's',
  --     mode = { 'n', 'x', 'o' },
  --     function()
  --       require('flash').jump()
  --     end,
  --     desc = 'Flash',
  --   },
  -- },
}
