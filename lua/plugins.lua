local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- this is essential.

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function ()
      require 'nvim-treesitter.configs'.setup {
        ensure_installed = "all",
        ignore_install = {"d", "phpdoc"},
        highlight = {
          enable = true,
          disable = { "vim", },
        }
      }
    end,
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  }

  use {
    'j-hui/fidget.nvim',
    config = function()
      require 'fidget'.setup{}
    end
  }
  use 'RRethy/vim-illuminate'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'L3MON4D3/LuaSnip'
  use {
    'weilbith/nvim-code-action-menu',
  }

  use {
    'ms-jpq/coq_nvim',
    requires = {
      'ms-jpq/coq.artifacts',
    },
    branch = 'coq',
    run = ':COQdeps',
    setup = function ()
      vim.g.coq_settings = {
        auto_start = 'shut-up',
        keymap = {
          jump_to_mark = "<c-,>"
        },
        clients = {
          paths = {
            path_seps = {
              "/"
            }
          },
          buffers = {
            match_syms = true
          }
        },
        display = {
          ghost_text = {
            enabled = true
          }
        }
      }
    end,
  }
  use 'sbdchd/neoformat'
  use 'jiangmiao/auto-pairs'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require 'Comment'.setup()
    end
  }
  use 'godlygeek/tabular'
  use 'tpope/vim-surround'
  use 'christoomey/vim-tmux-navigator'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'ggandor/leap.nvim',
    config = function ()
      require 'leap'.set_default_keymaps()
    end
  }
  use {
    'jakewvincent/mkdnflow.nvim',
    ft = 'md',
    config = function ()
      require('mkdnflow').setup({

      })
    end
  }
  use {"ellisonleao/glow.nvim", branch = 'main'}
  use {
    'jbyuki/nabla.nvim',
    ft = 'md'
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
  use 'petertriho/nvim-scrollbar'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyadzani42/nvim-web-devicons', opt=true },
  }

  use 'airblade/vim-gitgutter'
  use 'psliwka/vim-smoothie'

  use 'sainnhe/everforest'
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = ':CHADdeps'
  }
  -- use {
  --   'lambdalisue/fern.vim',
  --   requires = {
  --     'lambdalisue/fern-hijack.vim',
  --     'lambdalisue/fern-renderer-nerdfont.vim',
  --     'lambdalisue/nerdfont.vim',
  --     'antoinemadec/FixCursorHold.nvim'
  --   }
  -- }
end)
