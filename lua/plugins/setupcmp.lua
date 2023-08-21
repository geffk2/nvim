local cmp = require 'cmp'
local luasnip = require 'luasnip'
local select_opts = {behavior = cmp.SelectBehavior.Select}

local has_words_before = function()
---@diagnostic disable-next-line: deprecated
  table.unpack = unpack or table.unpack
  local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 1},
    {name = 'buffer', keyword_length = 1},
    {name = 'conjure'},
    {name = 'luasnip', keyword_length = 1},
    -- {name = 'copilot'},
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = {
      border = 'single',
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
      col_offset=-4,
      side_padding = 0
    }
  },
  formatting = {
    fields = {'kind', 'abbr', 'menu'},
    format = function(entry, item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    [" .. strings[2] .. "]"
      return kind
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),

    ['<CR>'] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Replace, }),
    -- ['<Space>'] = cmp.mapping.confirm({select = true}),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
}

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

cmp.setup.cmdline('/', {
  view = {
    entries = { name = 'wildmenu', separator = '|' },
  },
  sources = {
    {name = 'buffer'},
  }
})

cmp.setup.cmdline('?', {
  view = {
    entries = { name = 'wildmenu', separator = '|' },
  },
  sources = {
    {name = 'buffer'},
  }
})

