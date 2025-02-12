return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      toggle = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      picker = {
        enabled = true,
        win = {
          input = {
            -- stylua: ignore
            keys = {
              -- swap keymaps for scrolling preview & list 
              ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
              ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
              ["<c-b>"] = { "list_scroll_up", mode = { "i", "n" } },
              ["<c-f>"] = { "list_scroll_down", mode = { "i", "n" } },
            },
          },
        },
      },
    },
    keys = {},
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Create some toggle mappings
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tL'
          Snacks.toggle.line_number():map '<leader>tl'
          Snacks.toggle.inlay_hints():map '<leader>th'
          Snacks.toggle({
            name = 'Auto Format (Current Buffer)',
            get = function()
              return not vim.b.disable_autoformat
            end,
            set = function(state)
              if state == nil then
                state = true
              end
              vim.b.disable_autoformat = not state
            end,
          }):map '<leader>tf'
          Snacks.toggle({
            name = 'Auto Format (Global)',
            get = function()
              return not vim.g.disable_autoformat
            end,
            set = function(state)
              if state == nil then
                state = true
              end
              vim.g.disable_autoformat = not state
            end,
          }):map '<leader>tF'
        end,
      })

      -- Use wk.add because i want icons?
      local has_wk, wk = pcall(require, 'which-key')
      if has_wk then
        -- stylua: ignore
        wk.add {
          -- notifier
          { '<leader>u!', function() Snacks.notifier.show_history() end, desc = 'Notification History', icon = { icon = '󰝧' } },
          { '<leader>uX', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications', icon = { icon = '󰎟' } },
          -- explorer
          { "\\", function() Snacks.picker.explorer() end, desc = "File Explorer" },
          -- find
          { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
          { "<leader>fh", function() Snacks.picker.files({ hidden = true, follow = true }) end, desc = "Find include Hidden Files" },
          { "<leader>fa", function() Snacks.picker.files({ hidden = true, ignored = true, follow = true }) end, desc = "Find All Files" },
          { "<leader>fr", function() Snacks.picker.recent() end, desc = "Find Recent" },
          { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find Buffers" },
          { "<leader>fn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Neovim Config" },
          { "<leader>fl", function() Snacks.picker.files({ cwd = vim.fs.joinpath(vim.fn.stdpath 'data', 'lazy') }) end, desc = "Find Lazy Files" },
          -- buffers
          { "<leader><Tab>", function() Snacks.picker.buffers({current = false, title = 'Recent Buffers'}) end, desc = "Recent buffers", icon = { icon = '󱋡' } },
          -- grep
          { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep", icon = { icon = '' } },
          { "<leader>sG", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers", icon = { icon = '' } },
          { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" }, icon = { icon = '' } },
          -- search
          { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds", icon = { icon = '' } },
          { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines", icon = { icon = '󰘤' } },
          { "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands", icon = { icon = '' } },
          { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
          { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps",icon = { icon = '󰴠' } },
          { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps", icon = { icon = '󰌓' } },
          { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks", icon = { icon = '󰸕' } },
          { "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume", icon = { icon = '' } },
          { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History", icon = { icon = '' } },
          { "<leader>s?", function() Snacks.picker.help() end, desc = "Help", icon = { icon = '󰋗' } },
          -- Utils
          { "<leader>uc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", icon = { icon = '' } },
          { "<leader>ui", function() Snacks.picker.icons() end, desc = "Icons", icon = { icon = '󰒕' } },
          { "<leader>up", function() Snacks.picker.pickers() end, desc = "Snacks.pickers" },
        }
      end
    end,
  },
}
