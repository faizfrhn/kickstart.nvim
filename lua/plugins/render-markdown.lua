vim.pack.add {
  github 'nvim-treesitter/nvim-treesitter',
  github 'nvim-mini/mini.nvim',
  github 'MeanderingProgrammer/render-markdown.nvim',
}

require('render-markdown').setup {
  anti_conceal = {
    enabled = false, -- disable revealing raw syntax on cursor line
  },
}
