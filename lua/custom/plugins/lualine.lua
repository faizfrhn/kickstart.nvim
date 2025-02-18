return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    },
    sections = {
      lualine_b = {
        { 'branch', icon = '' },
      },
      lualine_c = {
        { 'diff', icon = { '' } },
        { 'diagnostics' },
        { 'filename', path = 1 },
      },
      lualine_z = {
        { 'searchcount' },
        { 'location' },
      },
    },
  },
}
