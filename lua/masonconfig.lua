local _M = {}

_M.on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]tion')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  nmap('=', vim.lsp.buf.format, 'Format')
  end, '[W]orkspace [L]ist Folders')

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

  }


  local lsp_defaults = {
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = require 'cmp_nvim_lsp'.update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = _M.on_attach,
    autostart = true
  }


  vim.schedule(function()
    -- require 'packer'.loader('coq_nvim coq.artifacts')
    -- local coq = require 'coq'
    require 'mason-lspconfig'.setup_handlers {
      function(server_name)
        local opts = vim.tbl_deep_extend('force', lsp_defaults, servers[server_name] or {})
        -- require('lspconfig')[server_name].setup(coq.lsp_ensure_capabilities(opts))
        require('lspconfig')[server_name].setup(opts)
      end
    }
  end)
end

return _M
