local ht = require 'haskell-tools'

local def_opts = { noremap = true, silent = true, }

ht.setup {
  hls = {
    on_attach = function(client, bufnr)
      local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })

      vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run, opts)
      vim.keymap.set('n', '<leader>hs', ht.hoogle.hoogle_signature, opts)
    end
  },
  hoogle = {
    mode = 'telescope-local',
  }
}
