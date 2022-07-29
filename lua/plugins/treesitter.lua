require 'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = {"d", "phpdoc"},
  highlight = {
    enable = true,
    disable = { "vim", },
  },
  rainbow = {
    enable = true,
   disable = vim.tbl_filter(
    function(p)
      return p ~= "clojure" and p ~= "commonlisp" and p ~= "fennel" and p ~= "query"
    end,
    require 'nvim-treesitter.parsers'.available_parsers()
  )
  }
}
