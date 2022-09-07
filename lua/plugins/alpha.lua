local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local cat = {
[[                   _ |\_  ]],
[[                   \` ..\ ]],
[[              __,.-" =__Y=]],
[[            ."        )   ]],
[[      _    /   ,    \/\_  ]],
[[     ((____|    )_-\ \_-` ]],
[[     `-----'`-----` `--`  ]],
[[           No Balls.      ]]
}

local amogus = {
  [[  . 　　　。　　　　•　 　ﾟ　　。 　　.]],
  [[.　　　 　　.　　　　　。　　 。　.]],
  [[.　　 。　　　　　 ඞ 。 . 　　 • 　　　　•]],
  [[ﾟ　　 Black was not An Impostor.　 。　.]],
  [['　　　 1 Impostor remains 　 　　。]],
  [[ﾟ　　　.　　　. ,　　　　.　 .]],
}

dashboard.section.header.val = cat

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button( "r", "  Recently used files"   , ":Telescope oldfiles<CR>"),
  dashboard.button( "f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button( "t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button( "s", "  Settings" , ":e $HOME/.config/nvim/init.lua | :cd %:p:h | split . | wincmd k | pwd<CR>"),
  dashboard.button( "q", "  Quit NVIM", ":qa<CR>"),
}

-- Set footer
-- local handle = assert(io.popen('fortune -s'))
-- local fortune = handle:read("*all")
-- handle:close()
-- dashboard.section.footer.val = fortune
dashboard.section.footer.val = "2+2=22"
dashboard.section.header.opts.hl = "Title"
dashboard.section.buttons.opts.hl = "Debug"
dashboard.section.footer.opts.hl = "Conceal"
dashboard.config.opts.noautocmd = true

-- vim.cmd[[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.opts)
