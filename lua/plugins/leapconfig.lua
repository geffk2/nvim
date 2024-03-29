local leap = require 'leap'

local function leap_in_win()
  leap.leap { target_windows = { vim.fn.win_getid() } }
end
local function leap_anywhere()
  leap.leap {
    target_windows = vim.tbl_filter(function(win)
      return vim.api.nvim_win_get_config(win).focusable
    end, vim.api.nvim_tabpage_list_wins(0)),
  }
end

-- vim.api.nvim_create_user_command("LeapAnywhere", leap_anywhere, {})
-- vim.api.nvim_create_user_command("LeapInWin", leap_in_win, {})


local wk = require "which-key"
wk.register { ["g<cr>"] = { leap_anywhere, "Leap to letter pair" } }

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("LeapSetup", { clear = true }),
  pattern = "*",
  callback = function(opts)
    if vim.g.vscode or vim.bo.buftype == "" or vim.bo.buftype == "help" then
      wk.register {
        ["<cr>"] = { leap_in_win, "Leap to letter pair within window" },
        mode = "n",
        buffer = opts.buf,
      }
      wk.register {
        ["<cr>"] = { leap_in_win, "Leap to letter pair within window" },
        mode = "o",
        buffer = opts.buf,
      }
      wk.register {
        ["<cr>"] = { leap_in_win, "Leap to letter pair within window", mode = "x", buffer = opts.buf },
      }
    end
  end,
})
