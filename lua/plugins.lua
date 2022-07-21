local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- this is essential.

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'gitsigns'.setup()
    end
  }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }

  -- LSP
  use {
    'j-hui/fidget.nvim',
    config = function()
      require 'fidget'.setup{}
    end
  }
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'weilbith/nvim-code-action-menu'

  -- Syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require 'plugins.treesitter'
    end,
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  }
  use 'jiangmiao/auto-pairs'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require 'Comment'.setup({
        mappings = {
          extra = true,
          basic = true
        }
      })
    end
  }
  use {
    'ms-jpq/coq_nvim',
    requires = {
      'ms-jpq/coq.artifacts',
    },
    branch = 'coq',
    run = ':COQdeps',
    setup = function ()
      require 'plugins.coq'
    end,
  }

  -- Navigation
  use {
    'anuvyklack/hydra.nvim',
    config = function()
      require 'plugins.hydra'
    end
  }

  use 'anuvyklack/vim-smartword'
  use 'chaoren/vim-wordmotion'

  use 'christoomey/vim-tmux-navigator'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require 'plugins.telescope'
    end
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'luc-tielen/telescope_hoogle'
  use {
    'ggandor/leap.nvim',
    config = function ()
      require 'leap'.set_default_keymaps()
    end
  }
  use {
    'matbme/JABS.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'jabs'.setup {
        width = 50,
        height = 10,
        border = 'shadow'
      }
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly',
    config = function()
      require 'nvim-tree'.setup {
        view = {
          side = "right",
          width = 40,
        },
        git = {
          enable = false,
        }
      }
    end
  }

  -- Colors
  use 'sainnhe/everforest'
  use 'sainnhe/edge'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }
  use 'edkolev/tmuxline.vim'

  -- Uncategorized
  use {
    'goolord/alpha-nvim',
    config = function ()
      require 'plugins.alpha'
    end
  }

  use 'RRethy/vim-illuminate'
  use 'L3MON4D3/LuaSnip'

  use 'sbdchd/neoformat'

  use 'godlygeek/tabular'
  use 'tpope/vim-surround'
  use {
    'jakewvincent/mkdnflow.nvim',
    ft = 'md',
    config = function ()
      require('mkdnflow').setup()
    end
  }
  use {
    'jbyuki/nabla.nvim',
    ft = 'md'
  }

  use {
    'petertriho/nvim-scrollbar',
    config = function()
      require 'scrollbar'.setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyadzani42/nvim-web-devicons', opt=true },
    config = function()
      require 'plugins.lualine'
    end
  }

  use 'psliwka/vim-smoothie'

end)


