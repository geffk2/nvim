local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- this is essential.

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
  use 'simrat39/symbols-outline.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  }
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require("lsp-colors").setup()
    end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }
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
      require 'Comment'.setup({
        mappings = {
          extra = true,
          basic = true
        }
      })
    end
  }
  use 'godlygeek/tabular'
  use 'tpope/vim-surround'
  use 'christoomey/vim-tmux-navigator'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require 'telescope'.setup {
        defaults = {
          prompt_prefix = "  \u{f422}  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          mappings = {
            n = { ["q"] = require("telescope.actions").close },
          },
        }
      }
    end
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
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly',
    config = function()
      require 'nvim-tree'.setup {
        view = {
          side = "right",
          width = 40,
        }
      }
    end
  }
end)


