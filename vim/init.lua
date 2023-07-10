-- Set encoding options
vim.opt.encoding = "utf-8"

-- Packer setup
local packer = require('packer')
local use = packer.use

packer.startup(function(use)
  -- Which Key
-- Lua
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- FZF
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf' },
    run = function() vim.fn['fzf#install']() end,
    config = function() vim.api.nvim_set_keymap('n', ',.', ':FZF<CR>', { noremap = true }) end,
  }

  -- Tagbar
  use {
    'majutsushi/tagbar',
    config = function()
      vim.g.tagbar_autoclose = 1
      vim.opt.tags:append('./tags,tags;$HOME')
      vim.api.nvim_set_keymap('n', ',,', ':Tags<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', ',t', ':TagbarToggle<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>tt', ':GenerateTags<CR>', { noremap = true })
    end,
  }

  -- ALE Lint
  use {
    'dense-analysis/ale',
    config = function()
      vim.g.ale_sign_warning = '.'
      vim.g.ale_lint_on_enter = 0
    end,
  }

  -- Vim session
  use {
    'xolox/vim-misc',
    'xolox/vim-session',
    config = function()
      vim.g.session_directory = vim.env.HOME .. '/.vim/sessions/'
      vim.g.session_command_aliases = 1
      vim.g.session_autosave = 'yes'
      vim.g.session_autoload = 'yes'
    end,
  }

  -- Visual
  use {
    'jdsimcoe/abstract.vim',
    config = function()
      vim.g.airline_theme = 'abstract'
    end,
  }

  use {
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    requires = { 'ryanoasis/vim-devicons' },
  }

  -- Chore
  use {
    'tpope/vim-repeat',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    config = function() vim.api.nvim_set_keymap('n', 'ys', '<Plug>Ysurroundw', {}) end,
  }

  use 'airblade/vim-gitgutter'
  use 'christoomey/vim-tmux-navigator'
  use 'iamcco/markdown-preview.nvim'

  -- Snippets
  use {
    'SirVer/ultisnips',
    requires = { 'honza/vim-snippets' },
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<c-c>"
      vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
    end,
  }

  use 'michaeljsmith/vim-indent-object'

  -- Python
  use {
    'jeetsukumaran/vim-pythonsense',
    ft = { 'python' },
  }

end)

-- Post plugin loading configs
vim.cmd('colorscheme abstract')

-- General configs
vim.opt.syntax = "on"
vim.opt.undofile = true
vim.opt.undodir = "/home/joao.menezes/vim_cache"

vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.shortmess:append("A")
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
vim.opt.encoding = "utf8"
vim.opt.backspace = "indent,eol,start"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.laststatus = 2
vim.opt.ignorecase = true
vim.opt.autoread = true
vim.opt.pastetoggle = "<C-P>"
vim.opt.incsearch = true
vim.opt.redrawtime = 10000
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.scrolloff = 5

-- Mappings
vim.api.nvim_set_keymap('n', '<Leader>cp', '"+y:echo "selection copied!"<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cl', '<Esc>0v$h"+y:echo "line copied!"<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cw', 'viw"+y:echo "word copied!"<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '//', 'y/<C-R>"<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>vs', ':source ~/.vimrc<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>z', ':call utils#window_zoom()<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>-', ':m-2<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>_', ':m+1<CR>', { noremap = true })

vim.api.nvim_set_keymap('v', '<C-R>', ':s/\\%V', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-]>', '<Esc>:exe "tjump " . expand("<cword>")<Esc>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-W>]', '<C-W>v<C-]>', {noremap = true})

-- Add other custom functions and mappings to your init.lua or an external Lua file and require it here.

