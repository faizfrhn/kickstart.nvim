return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed, not both.
      'nvim-telescope/telescope.nvim', -- optional
      -- 'ibhagwan/fzf-lua', -- optional
    },
    cmd = 'Neogit',
    init = function()
      require('which-key').add {
        {
          '<leader>un',
          function()
            require('neogit').open()
          end,
          desc = 'Neogit',
          icon = { icon = '󰊢', color = 'orange' },
        },
      }
    end,
  },
}
