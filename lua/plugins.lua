return require('lazy').setup({
  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require 'gitsigns'.setup()
    end
  },
  {'nvim-lua/plenary.nvim', lazy=true},

  -- DAP
  'mfussenegger/nvim-dap',

  -- LSP
  {
    'j-hui/fidget.nvim',
    config = true,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    ft = { 'lua', 'python', 'sh', 'tex', 'cpp', 'Dockerfile', 'zsh'},
    enabled = false,
    config = function()
      require 'null-ls'.setup {
        on_attach = require 'masonconfig'.on_attach,
        sources = {
          require 'null-ls'.builtins.diagnostics.shellcheck,
          require 'null-ls'.builtins.diagnostics.cppcheck,
          require 'null-ls'.builtins.diagnostics.hadolint,
          require 'null-ls'.builtins.formatting.autopep8,
          require 'null-ls'.builtins.formatting.lua_format,
          require 'null-ls'.builtins.hover.printenv.with({
            filetypes = { "sh", "zsh",},
          }),
        }
      }
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require 'masonconfig'.config()
    end,
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      {
        'folke/neodev.nvim',
        setup = true,
      },
    }
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = true,
    dependencies = { 'williamboman/mason.nvim' }
  },
  {
    'SmiteshP/nvim-navic',
    enabled = true,
    dependencies = { 'williamboman/mason.nvim' },
    config = true
  },
  {
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
  },

  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
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
  },

  {
    'mrcjkb/haskell-tools.nvim',
    ft = { 'haskell', },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'williamboman/mason.nvim',
    },
    branch = '1.x.x',
    config = function()
      require 'plugins.htoolsconfig'
    end
  },

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufRead',
    build = ':TSUpdate',
    config = function ()
      require 'plugins.treesitter'
    end,
    dependencies = {
      -- 'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require 'Comment'.setup({
        mappings = {
          extra = true,
          basic = true
        }
      })
    end
  },
  'rafamadriz/friendly-snippets',
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    event = "VimEnter",
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  {
    'github/copilot.vim',
    enabled = false,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'UIEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'L3MON4D3/luasnip',
        version = 'v1.1.*',
        config = function()
          require 'luasnip.loaders.from_vscode'.lazy_load()
          require 'luasnip.loaders.from_vscode'.lazy_load { paths = { "./snips" } }
        end
      },
      'saadparwaiz1/cmp_luasnip',
      'onsails/lspkind.nvim',
      {
        "zbirenbaum/copilot-cmp",
        enabled = false,
        config = true,
      },
    },
    config = function()
      local lspkind = require("lspkind")
      lspkind.init({
        symbol_map = {
          Copilot = "",
        },
      })
      require 'plugins.setupcmp'
    end
  },

  {
    'lervag/vimtex',
    ft = 'tex',
  },

  -- Navigation
  {
    'folke/which-key.nvim',
    lazy = false,
    config = function()
      require 'plugins.wk'
    end,
  },
  {
    'anuvyklack/hydra.nvim',
    event = 'BufReadPost',
    dependencies = {
      'sindrets/diffview.nvim',
      {'TimUntersberger/neogit', opts = { integrations = { diffview = true}}},
    },
    keys = {'<leader>g'},
    config = function()
      require 'plugins.hydra'
    end
  },
  {
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
      local animate = require 'mini.animate'
      animate.setup({
        cursor = { enable = false, },
        scroll = { timing = animate.gen_timing.linear({duration = 200, unit = 'total'})},
      })
      require 'plugins.starter'
      require 'mini.bracketed'.setup()

      vim.api.nvim_set_hl(0, 'MiniAnimateCursor', { bg='#ffffff' })
    end
  },
  -- 'psliwka/vim-smoothie',

  {
    'folke/zen-mode.nvim',
    ft = { 'markdown', 'tex'},
    cmd = 'ZenMode',
    config = true,
  },
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "edluffy/hologram.nvim" },
    event = 'UIEnter',
    config = true,
    enabled = false,
  },
  {
    -- Peek line numbers
    'nacro90/numb.nvim',
    config = true
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = true,
  },

  {
    'numToStr/Navigator.nvim',
    config = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'debugloop/telescope-undo.nvim', }
    },
    event = 'UIEnter',
    config = function()
      require 'plugins.telescope'
    end
  },
  {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup()
    end
  },
  {
    'ggandor/leap.nvim',
    config = function ()
      require 'leap'.setup {}
      -- require 'leap'.add_default_mappings()
      require 'plugins.leapconfig'
    end
  },
  {
    'matbme/JABS.nvim',
    config = function()
      require 'jabs'.setup {
        width = 50,
        height = 10,
        border = 'shadow'
      }
    end
  },

  'kyazdani42/nvim-web-devicons',
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    enabled = false,
    keys = {
      {'<leader>tt', '<cmd>NeoTreeShowToggle<CR>', 'NeoTree toggle'},
      {'<leader>tb', '<cmd>NeoTreeShowToggle buffers<CR>', 'NeoTree toggle buffers'}
    },
    config = function()
      require 'plugins.neotree'
    end
  },

  -- colors
  {'sainnhe/everforest', lazy = true,},
  
  {'mcchrish/zenbones.nvim', dependencies={'rktjmp/lush.nvim'}},

  {
    'sainnhe/edge',
    lazy = false,
    priority = 1000,
  },
  {'sainnhe/sonokai', lazy = true},
  {
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    as = 'catppuccin',
    config = function()
      require 'catppuccin'.setup {
        flavour = 'macchiato',
        term_colors = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          telescope = true,
          mini = true,
        }
      }
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  },
  -- Python
  {
    'jpalardy/vim-slime',
    ft = 'python',
    config = function()
      vim.g.slime_target = 'tmux'
      vim.g.slime_default_config = {
        socket_name = 'default',
        target_pane = '{last}'
      }
      vim.g.slime_python_ipython = 1
    end
  },

  -- obsidian
  {
    'preservim/vim-markdown',
    dependencies = { 'godlygeek/tabular' },
    ft = 'markdown',
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end
  },
  {
    'phaazon/mind.nvim',
    enabled = false,
    branch = 'v2.2',
    requires = { 'nvim-lua/plenary.nvim' },
    config = true,
    opts = { }
  },
  {
    'epwalsh/obsidian.nvim',
    enabled = false,
    event = 'BufEnter ~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Uni/*',
    config = function ()
      require 'obsidian'.setup {
        dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Uni/",
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
  },
  {
    'jbyuki/venn.nvim',
    ft= 'markdown',
  },

  -- Clojure
  {
    'Olical/conjure',
    branch = 'master',
    ft = { 'clojure', 'fennel', 'racket' }
  },
  {
    'guns/vim-sexp',
    ft = { 'clojure', 'fennel' }
  },
  {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = { 'clojure', 'fennel' }
  },

  'jghauser/mkdir.nvim',

  {
    'RRethy/vim-illuminate',
    event = 'BufRead',
  },

  {
    'miversen33/netman.nvim',
    cmd = 'Netman',
    config = function()
      require 'netman'
    end
  },
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true
      })
    end,
  },
  'godlygeek/tabular',
  {
    enabled = false,
    'petertriho/nvim-scrollbar',
    config = function()
      require 'scrollbar'.setup()
    end
  },
  {
    'rebelot/heirline.nvim',
    enabled=false,
    event = 'UIEnter',
    config = function()
      require 'plugins.heirline'
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    enabled=true,
    config = function()
      require 'plugins.lualine'
    end
  },
  {
    'RaafatTurki/hex.nvim',
    cmd = 'HexToggle',
    config = true,
  },
  {
    "kdheepak/tabline.nvim",
    lazy = true,
    enabled=true,
    dependencies = { 'nvim-lualine/lualine.nvim', 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'tabline'.setup {
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          component_separators = { '', '' },
          section_separators = { '', '' },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = true, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        }
      }
      vim.cmd [[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
  },
})
