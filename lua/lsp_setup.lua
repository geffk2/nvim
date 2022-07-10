local on_attach = function(_, bufnr)
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
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', vim.lsp.buf.format or vim.lsp.buf.formatting, { desc = 'Format current buffer with LSP' })
end

local servers = {
  clangd = {},
  rust_analyzer = {},
  hls = {},
  pyright = {},
  tsserver = {},
  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'}
        }
      }
    }
  },
  elixirls = {},
  gopls = {},
  svelte = {},
  tailwindcss = {},
}
-- local lsp = require 'lspconfig'
local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = on_attach
}

local lspis = require 'nvim-lsp-installer.servers'
local function install_servers(servs, options)
  for name, _ in pairs(servs) do
    local available, server = lspis.get_server(name)

    if available then
      -- 
      server:on_ready(function()
        local opts = vim.tbl_deep_extend("force", options, servs[server.name] or {})
        server:setup(opts)
      end)
    end

    if not server:is_installed() then
      server:install()
    end
  end
end

vim.schedule(function()
  require("packer").loader("coq_nvim coq.artifacts")
  local opts = require("coq")().lsp_ensure_capabilities(lsp_defaults)
  install_servers(servers, opts)
end)


