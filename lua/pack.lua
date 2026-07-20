-- [[ Using vimpack to manage plugins ]]

-- Expand GitHub shorthand (owner/repo) into a full HTTPS URL
_G.github = function(repo) return 'https://github.com/' .. repo end

-- [[ Autocmd]]
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

-- Plugins to load..
require 'plugins.guess-indent'
require 'plugins.which-key'
require 'plugins.autopairs'
require 'plugins.gitsigns'

require 'plugins.tokyonight'
require 'plugins.todo-comments'

require 'plugins.mini'

-- Additional plugins I use
require 'plugins.snacks'
require 'plugins.lualine'
require 'plugins.neogit'

-- LSP, treesitter stuffs
require 'plugins.lspconfig'
require 'plugins.blink-cmp'
require 'plugins.conform'
require 'plugins.treesitter'

-- vim: ts=2 sts=2 sw=2 et
