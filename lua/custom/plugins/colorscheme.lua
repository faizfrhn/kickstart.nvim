return {
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          -- comments = { italic = false }, -- Disable italics in comments
        },
      }
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      groups = {
        all = {
          WhichKeyNormal = { bg = 'palette.bg1' },
        },
      },
    },
    init = function()
      -- vim.cmd.colorscheme 'nordfox'
    end,
  },
}
