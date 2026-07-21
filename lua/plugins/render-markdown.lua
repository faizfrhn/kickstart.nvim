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

local ok, Snacks = pcall(require, 'snacks')
if ok then
  Snacks.toggle({
    name = 'Render Markdown',
    get = function() return vim.cmd 'RenderMarkdown get' end,
    set = function()
      vim.cmd 'RenderMarkdown toggle'
    end,
  }):map '<leader>tm'
end
