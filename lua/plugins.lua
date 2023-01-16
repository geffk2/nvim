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

  -- LSP
  use {
    'j-hui/fidget.nvim',
    config = function()
      require 'fidget'.setup{}
    end
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    disable = true,
    requires = 'nvim-lua/plenary.nvim' ,
    config = function()
      require 'null-ls'.setup {
        sources = {
          require 'null-ls'.builtins.diagnostics.shell_check,
          require 'null-ls'.builtins.diagnostics.chktex,
          require 'null-ls'.builtins.diagnostics.cppcheck,
          require 'null-ls'.builtins.diagnostics.luacheck,
          require 'null-ls'.builtins.diagnostics.pylint
        }
      }
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
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require 'plugins.sagaconf'
    end,
  }
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
  use 'nvim-treesitter/playground'
  use 'p00f/nvim-ts-rainbow'
  use 'wlangstroth/vim-racket'
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
    tag = 'v1.1.*',
    config = function()
      require 'luasnip.loaders.from_vscode'.lazy_load()
      require 'luasnip.loaders.from_vscode'.lazy_load { paths = { "./snips" } }
    end
  }
  use 'rafamadriz/friendly-snippets'

  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
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
      local lspkind = require("lspkind")
      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })
      require 'plugins.setupcmp'
    end
  }

  use {
    'lervag/vimtex'
  }

  -- Navigation
  use {
    'folke/which-key.nvim',
    config = function()
      require 'plugins.wk'
    end
  }
  use {
    'anuvyklack/hydra.nvim',
    config = function()
      require 'plugins.hydra'
    end
  }
  use {
    'echasnovski/mini.nvim',
    config = function()
      require "mini.pairs".setup()
      require('mini.surround').setup({
        mappings = {
          add = 'ys',
          delete = 'ds',
          find = '',
          find_left = '',
          highlight = '',
          replace = 'cs',
          update_n_lines = '',
          suffix_last = '',
          suffix_next = '',
        },
        search_method = 'cover_or_next',
      })
      require 'mini.ai'.setup()
      require 'mini.jump'.setup()
      -- require 'mini.animate'.setup()
      require 'plugins.starter'

      vim.api.nvim_set_hl(0, 'MiniJump', { underdouble = true, bold = true })
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
      require 'leap'.setup {}
      require 'leap'.add_default_mappings()
      require 'plugins.leapconfig'
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
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = function()
      require 'plugins.neotree'
    end
  }

  -- colors
  use 'sainnhe/everforest'
  use 'sainnhe/edge'
  use 'sainnhe/sonokai'
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require 'catppuccin'.setup {
        flavour = 'mocha'
      }
    end
  }
  use 'glepnir/zephyr-nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }
  -- Python
  use {
    'jpalardy/vim-slime',
    config = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_default_config = {
        socket_name = 'default',
        target_pane = '{last}'
      }
      vim.g.slime_python_ipython = 1
    end
  }

  -- obsidian 
  use {
    'preservim/vim-markdown',
    requires = { 'godlygeek/tabular' },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end
  }
  use {
    'epwalsh/obsidian.nvim',
    config = function ()
      require 'obsidian'.setup {
        dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/DnD/",
      }
      vim.keymap.set("n", "gf",
        function()
          if require('obsidian').util.cursor_on_markdown_link() then
            return "<cmd>ObsidianFollowLink<CR>"
          else
            return "gf"
          end
        end, { noremap = false, expr = true})
    end
  }

  -- Clojure
  use 'radenling/vim-dispatch-neovim'
  -- use 'tpope/vim-surround'
  use 'clojure-vim/vim-jack-in'
  use {
    'Olical/conjure',
    branch = 'master',
    ft = { 'clojure', 'fennel', 'racket' }
  }
  use {
    'guns/vim-sexp',
    ft = { 'clojure', 'fennel' }
  }
  use {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = { 'clojure', 'fennel' }
  }

  use 'jghauser/mkdir.nvim'
  use 'RRethy/vim-illuminate'

  use 'sbdchd/neoformat'
  use 'miversen33/netman.nvim'

  use {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })
    end,
  }
  use 'godlygeek/tabular'
  use {
    disable = true,
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


