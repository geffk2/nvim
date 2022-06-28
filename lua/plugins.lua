local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- this is essential.

  use {'neoclide/coc.nvim', branch='release'}

  use 'jiangmiao/auto-pairs'
  use 'preservim/nerdcommenter'
  use 'godlygeek/tabular'
  use 'tpope/vim-surround'
  use 'christoomey/vim-tmux-navigator'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  } 
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use 'glepnir/dashboard-nvim'
  use 'petertriho/nvim-scrollbar'
  use 'vim-airline/vim-airline'
  use 'airblade/vim-gitgutter'
  use 'psliwka/vim-smoothie'

  use 'sainnhe/everforest'

  use {
    'lambdalisue/fern.vim',
    requires = {
      'lambdalisue/fern-hijack.vim',
      'lambdalisue/fern-renderer-nerdfont.vim',
      'lambdalisue/nerdfont.vim',
      'antoinemadec/FixCursorHold.nvim'
    }
  }

  use 'junegunn/fzf.vim'
  use 'monkoose/fzf-hoogle.vim'

  use 'leafOfTree/vim-svelte-plugin'  
  use 'jbyuki/nabla.nvim'
end)
