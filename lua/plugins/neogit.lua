vim.pack.add {
  github 'NeogitOrg/neogit',
  github 'nvim-lua/plenary.nvim',
  github 'sindrets/diffview.nvim',
  github 'folke/snacks.nvim',
}

-- [[ Keymap ]]
local has_wk, wk = pcall(require, 'which-key')

if has_wk then
  wk.add {
    {
      '<leader>un',
      function() require('neogit').open() end,
      desc = 'Neogit',
      icon = { icon = '󰊢', color = 'orange' },
    },
  }
end
