return {
  {
    'otavioschwanck/arrow.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    opts = {
      -- always_show_path = true,
      show_icons = true,
      leader_key = "<leader>'",
      mappings = {
        save = 's',
      },
      window = {
        title = ' 󱡁 Navigate Files ',
        title_pos = 'center',
        row = 0,
        -- row = vim.o.lines - 10 - 1,
        col = 2,
        border = 'rounded',
      },
    },
  },
}
