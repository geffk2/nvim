-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/katja/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/katja/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/katja/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/katja/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/katja/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\2\nbasic\2\nextra\2\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["JABS.nvim"] = {
    config = { "\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\vborder\vshadow\vheight\3\n\nwidth\0032\nsetup\tjabs\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/coq.artifacts",
    url = "https://github.com/ms-jpq/coq.artifacts"
  },
  coq_nvim = {
    loaded = true,
    needs_bufread = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/opt/coq_nvim",
    url = "https://github.com/ms-jpq/coq_nvim"
  },
  everforest = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\24set_default_keymaps\tleap\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-colors\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mkdnflow.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rmkdnflow\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/opt/mkdnflow.nvim",
    url = "https://github.com/jakewvincent/mkdnflow.nvim"
  },
  ["nabla.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/opt/nabla.nvim",
    url = "https://github.com/jbyuki/nabla.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  ["nvim-code-action-menu"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollbar"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\na\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\0\1\0\2\tside\nright\nwidth\3(\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n∫\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14highlight\fdisable\1\2\0\0\bvim\1\0\1\venable\2\19ignore_install\1\3\0\0\6d\vphpdoc\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n“\a\0\0\t\0'\0<6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2%\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0036\4\0\0'\6\b\0B\4\2\0029\4\t\4=\4\n\0035\4\v\0=\4\f\0036\4\0\0'\6\b\0B\4\2\0029\4\r\4=\4\14\0035\4\15\0=\4\16\0034\4\0\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0036\4\0\0'\6\22\0B\4\2\0029\4\23\0049\4\24\4=\4\25\0036\4\0\0'\6\22\0B\4\2\0029\4\26\0049\4\24\4=\4\27\0036\4\0\0'\6\22\0B\4\2\0029\4\28\0049\4\24\4=\4\29\0035\4\"\0005\5 \0006\6\0\0'\b\30\0B\6\2\0029\6\31\6=\6!\5=\5#\4=\4$\3=\3&\2B\0\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\17path_display\1\2\0\0\rtruncate\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\1\2\0\0\17node_modules\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\15horizontal\1\0\3\19preview_cutoff\3x\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\nwidth\4◊«¬Î\3äÆØˇ\3\1\0\3\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\20prompt_position\btop\1\0\6\17initial_mode\vinsert\20layout_strategy\15horizontal\21sorting_strategy\14ascending\23selection_strategy\nreset\19color_devicons\2\18prompt_prefix\f  Ôê¢  \nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-smoothie"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/vim-smoothie",
    url = "https://github.com/psliwka/vim-smoothie"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/katja/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: coq_nvim
time([[Setup for coq_nvim]], true)
try_loadstring("\27LJ\2\nˆ\1\0\0\5\0\18\0\0196\0\0\0009\0\1\0005\1\3\0005\2\4\0=\2\5\0015\2\t\0005\3\a\0005\4\6\0=\4\b\3=\3\n\0025\3\v\0=\3\f\2=\2\r\0015\2\15\0005\3\14\0=\3\16\2=\2\17\1=\1\2\0K\0\1\0\fdisplay\15ghost_text\1\0\0\1\0\1\fenabled\2\fclients\fbuffers\1\0\1\15match_syms\2\npaths\1\0\0\14path_seps\1\0\0\1\2\0\0\6/\vkeymap\1\0\1\17jump_to_mark\n<c-,>\1\0\1\15auto_start\fshut-up\17coq_settings\6g\bvim\0", "setup", "coq_nvim")
time([[Setup for coq_nvim]], false)
time([[packadd for coq_nvim]], true)
vim.cmd [[packadd coq_nvim]]
time([[packadd for coq_nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\na\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tview\1\0\0\1\0\2\tside\nright\nwidth\3(\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: JABS.nvim
time([[Config for JABS.nvim]], true)
try_loadstring("\27LJ\2\nX\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\vborder\vshadow\vheight\3\n\nwidth\0032\nsetup\tjabs\frequire\0", "config", "JABS.nvim")
time([[Config for JABS.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n∫\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\14highlight\fdisable\1\2\0\0\bvim\1\0\1\venable\2\19ignore_install\1\3\0\0\6d\vphpdoc\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n“\a\0\0\t\0'\0<6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2%\0005\3\3\0005\4\5\0005\5\4\0=\5\6\4=\4\a\0036\4\0\0'\6\b\0B\4\2\0029\4\t\4=\4\n\0035\4\v\0=\4\f\0036\4\0\0'\6\b\0B\4\2\0029\4\r\4=\4\14\0035\4\15\0=\4\16\0034\4\0\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0036\4\0\0'\6\22\0B\4\2\0029\4\23\0049\4\24\4=\4\25\0036\4\0\0'\6\22\0B\4\2\0029\4\26\0049\4\24\4=\4\27\0036\4\0\0'\6\22\0B\4\2\0029\4\28\0049\4\24\4=\4\29\0035\4\"\0005\5 \0006\6\0\0'\b\30\0B\6\2\0029\6\31\6=\6!\5=\5#\4=\4$\3=\3&\2B\0\2\1K\0\1\0\rdefaults\1\0\0\rmappings\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\17path_display\1\2\0\0\rtruncate\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\1\2\0\0\17node_modules\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\15horizontal\1\0\3\19preview_cutoff\3x\vheight\4ö≥ÊÃ\tô≥¶ˇ\3\nwidth\4◊«¬Î\3äÆØˇ\3\1\0\3\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\18preview_width\4ö≥ÊÃ\tô≥Üˇ\3\20prompt_position\btop\1\0\6\17initial_mode\vinsert\20layout_strategy\15horizontal\21sorting_strategy\14ascending\23selection_strategy\nreset\19color_devicons\2\18prompt_prefix\f  Ôê¢  \nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\24set_default_keymaps\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\2\nbasic\2\nextra\2\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType md ++once lua require("packer.load")({'mkdnflow.nvim', 'nabla.nvim'}, { ft = "md" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
