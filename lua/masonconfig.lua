local _M = {}

_M.on_attach = function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- vim.api.nvim_create_autocmd('CursorHold', {
  --   buffer = bufnr,
  --   callback = function()
  --     vim.diagnostic.open_float()
  --   end
  -- })

  -- if client.server_capabilities.documentSymbolProvider then
  --   require 'nvim-navic'.attach(client, bufnr)
  -- end

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting,
  { desc = 'Format current buffer with LSP' })
end

_M.config = function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })
end

_M.setup = function()
  local servers = {
    sumneko_lua = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    },
    pyright = {
      python = {
        pythonPath = 'python3'
      }
    }
  }


  local lsp_defaults = {
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require 'cmp_nvim_lsp'.default_capabilities(),
    on_attach = _M.on_attach,
    autostart = true
  }


  vim.schedule(function()
    require 'mason-lspconfig'.setup_handlers {
      function(server_name)
        local opts = vim.tbl_deep_extend('force', lsp_defaults, servers[server_name] or {})
        require('lspconfig')[server_name].setup(opts)
      end
    }
  end)
end

return _M
