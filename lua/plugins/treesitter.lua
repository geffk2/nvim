require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {"d", "phpdoc"},
  highlight = {
    enable = true,
    disable = { "vim", },
  }
}
