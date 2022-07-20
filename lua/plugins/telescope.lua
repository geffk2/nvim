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
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
    ["ui-select"] = {
      require 'telescope.themes'.get_cursor {}
    }
  }
}
require 'telescope'.load_extension("ui-select")
require 'telescope'.load_extension("hoogle")

local tele = require 'telescope.builtin'
vim.keymap.set('n' , '<leader>ff' , tele.find_files)
vim.keymap.set('n' , '<leader>fg' , tele.live_grep)
vim.keymap.set('n' , '<leader>fh' , tele.help_tags)
vim.keymap.set('n' , '<leader>fm' , tele.man_pages)
vim.keymap.set('n' , '<leader>fd' , tele.diagnostics)
vim.keymap.set('n' , '<leader>fq' , tele.quickfix)

vim.keymap.set('n' , '<leader>=' , ':Tabularize /=<cr>')
vim.keymap.set('n' , '<leader>-' , ':Tabularize /-<cr>')
vim.keymap.set('n' , '<leader>,' , ':Tabularize /,<cr>')
vim.keymap.set('n' , '<leader>#' , ':Tabularize /#<cr>')
vim.keymap.set('n' , '<leader>:' , ':Tabularize /:<cr>')


