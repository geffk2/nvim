require 'telescope'.setup {
  defaults = {
    prompt_prefix = "  \u{f422}  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules", '*lazy-lock.json*' },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    border = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
      hijack_netrw = true,
    }
  }
}

local themes = {
  command_pane = {
    theme = 'command_pane',
    preview = false,
    prompt_title = false,
    results_title = false,
    sorting_strategy = 'descending',
    layout_strategy = 'bottom_pane',
    layout_config = {
      height = 13,
      preview_cutoff = 1,
      prompt_position = 'bottom'
    },
  },
  popup_list = {
    theme = 'popup_list',
    border = true,
    preview = false,
    prompt_title = false,
    results_title = false,
    sorting_strategy = 'ascending',
    layout_strategy = 'center',
    borderchars = {
      prompt  = { '─', '│', '─', '│', '┌', '┐', '┤', '└' },
      results = { '─', '│', '─', '│', '├', '┤', '┘', '└' },
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
  },
}

local use_theme = function(picker, theme)
  return function() picker(themes[theme]) end
end

-- require 'telescope'.load_extension("ui-select")
require 'telescope'.load_extension 'file_browser'

local tele = require 'telescope.builtin'
local wk = require 'which-key'


wk.register({
  f = {
    name = "Find",
    r = { tele.resume, "Resume search" },
    f = { tele.find_files, "Files" },
    g = { tele.live_grep, "Live grep" },
    h = { tele.help_tags, "Help tags" },
    H = { tele.highlights, "Highlights" },
    m = { tele.man_pages, "Man pages" },
    d = { tele.diagnostics, "Diagnostics" },
    q = { tele.quickfix, "Quickfix list" },
    c = { use_theme(tele.commands, 'command_pane'), "Commands" },
    b = { require 'telescope'.extensions.file_browser.file_browser, "File browser"}
  },
  ds = { tele.lsp_document_symbols, 'Document Symbols' }
}, { prefix = "<leader>" })


-- vim.keymap.set('n', '<leader>=', ':Tabularize /=<cr>')
-- vim.keymap.set('n', '<leader>-', ':Tabularize /-<cr>')
-- vim.keymap.set('n', '<leader>,', ':Tabularize /,<cr>')
-- vim.keymap.set('n', '<leader>#', ':Tabularize /#<cr>')
-- vim.keymap.set('n', '<leader>:', ':Tabularize /:<cr>')


-- local colors = EdgeGetPalette()
-- local telescope_color = {
-- 	-- TelescopeMatching = { fg = colors.flamingo },
-- 	-- TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
-- 	-- TelescopePromptPrefix = { bg = colors.surface0 },
-- 	-- TelescopePromptNormal = { bg = colors.bg_red[0] },
-- 	-- TelescopeResultsNormal = { bg = colors.mantle },
-- 	-- TelescopePreviewNormal = { bg = colors.mantle },
-- 	TelescopeBorder = { fg = colors.purple[1], bg = colors.bg0[1]  },
--         -- TelescopeNormal = {  },
-- 	-- TelescopePromptBorder = { bg = colors.bg3[0] },
-- 	-- TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
-- 	-- TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
-- 	TelescopeTitle = { bg = colors.purple[1], fg = colors.black[1] },
-- 	-- TelescopeResultsTitle = { fg = colors.mantle },
-- 	-- TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
-- }
-- for hl, col in pairs(telescope_color) do
--   vim.api.nvim_set_hl(0, hl, col)
-- end
--
