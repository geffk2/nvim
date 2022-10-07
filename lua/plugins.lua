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

  -- DAP
  use 'mfussenegger/nvim-dap'
  use {
    'rcarriga/nvim-dap-ui',
    requires = { 'mfussenegger/nvim-dap' },
    config = function()
      require 'dapui'.setup()
    end
  }

  -- LSP
  use {
    'j-hui/fidget.nvim',
    config = function()
      require 'fidget'.setup{}
    end
  }
  use {
    'neovim/nvim-lspconfig',
    after = 'mason-lspconfig.nvim',
  }
  use {
    'williamboman/mason.nvim',
    config = function()
      require 'masonconfig'.config()
    end
  }
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require 'plugins.sagaconf'
    end,
  })
  use {
    'williamboman/mason-lspconfig.nvim',
    after = 'mason.nvim'
  }
  use {
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    config = function()
      require 'rust-tools'.setup {
        tools = {
          runnables = {
            use_telescope = true,
          }
        },
        server = {
          settings = {
            ["rust_analyzer"] = {
              assist = {
                importEnforceGranularity = true,
                importPrefix = 'crate',
              },
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = 'clippy'
              },
            },
          },
          on_attach = function(a, bufnr)
            require 'masonconfig'.on_attach(a, bufnr)
            local rt = require 'rust-tools'
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, {buffer = bufnr})
          end,
        }
      }
      vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>RustRun<cr>', {silent = true, noremap = true})
    end
  }

  use {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require('crates').setup {
        src = {
          coq = {
            enabled = true,
            name = "crates.nvim",
          }
        }
      }
    end,
  }

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
  use 'p00f/nvim-ts-rainbow'
  -- use 'jiangmiao/auto-pairs'
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
    disable = true,
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
  use {
    'L3MON4D3/luasnip',
    config = function()
      require 'luasnip.loaders.from_vscode'.lazy_load()
    end
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/luasnip',
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim'
    },
    after = 'luasnip',
    config = function()
      require 'plugins.setupcmp'
    end
  }

  use {
    'lervag/vimtex'
  }

  -- Navigation
  use {
    'anuvyklack/hydra.nvim',
    config = function()
      require 'plugins.hydra'
    end
  }
  use {
    'echasnovski/mini.nvim',
    config = function()
      require 'mini.pairs'.setup()
      require 'mini.surround'.setup()
      require 'mini.ai'.setup()
    end
  }
  use {
    'nacro90/numb.nvim',
    config = function()
      require 'numb'.setup()
    end
  }

  use 'christoomey/vim-tmux-navigator'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require 'plugins.telescope'
    end
  }
  use {
    'stevearc/dressing.nvim',
    config = function()
      require 'dressing'.setup {
        select = {
          -- backend = { 'builtin', 'telescope', 'fzf_lua', 'fzf', 'nui' }
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
    disable = true,
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
  use 'sainnhe/sonokai'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }

  -- Clojure
  use 'radenling/vim-dispatch-neovim'
  use 'clojure-vim/vim-jack-in'
  use {
    'Olical/conjure',
    branch = 'master',
    ft = { 'clojure', 'fennel' }
  }
  use {
    'guns/vim-sexp',
    ft = { 'clojure', 'fennel' }
  }
  use {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = { 'clojure', 'fennel' }
  }

  -- Uncategorized
  use {
    'goolord/alpha-nvim',
    config = function ()
      require 'plugins.alpha'
    end
  }
  use 'jghauser/mkdir.nvim'
  use 'RRethy/vim-illuminate'
  use 'L3MON4D3/LuaSnip'

  use 'sbdchd/neoformat'

  use 'godlygeek/tabular'
  -- use 'tpope/vim-surround'
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


