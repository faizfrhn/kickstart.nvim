return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  dependencies = { 'saghen/blink.cmp' },
  config = function()
    -- set default on startup
    local M = { preview_enabled = true }

    -- Disable automatic previews.
    require('markview').setup {
      preview = { enable = M.preview_enabled },
    }

    local ok, Snacks = pcall(require, 'snacks')
    if ok then
      Snacks.toggle({
        name = 'Markview',
        get = function()
          return M.preview_enabled
        end,
        set = function()
          vim.cmd 'Markview'
          M.preview_enabled = not M.preview_enabled
        end,
      }):map '<leader>tm'
    end
  end,
}
