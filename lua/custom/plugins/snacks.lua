return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      toggle = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      picker = { enabled = true }
    },
    keys = {
      -- notifier
      { '<leader>u!', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
      { '<leader>ud', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications' },
      -- explorer
      { "\\", function() Snacks.picker.explorer() end, desc = "Explorer" },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Create some toggle mappings
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tL'
          Snacks.toggle.line_number():map '<leader>tl'
          Snacks.toggle.inlay_hints():map '<leader>th'
          Snacks.toggle({
            name = 'Auto Format (Global)',
            get = function()
              return vim.g.autoformat == nil or vim.g.autoformat
            end,
            set = function(state)
              if state == nil then
                state = true
              end
              vim.g.autoformat = state
            end,
          }):map '<leader>tF'
        end,
      })
    end,
  },
}
