local starter = require 'mini.starter'

starter.setup {
  autoopen = true,
  items = {
    { name = 'Settings', action = 'e $HOME/.config/nvim/init.lua | :cd %:p:h |  pwd', section = 'Do stuff' },
    { name = 'Nix config', action = 'e $HOME/.config/home-manager/home.nix | :cd %:h | pwd', section = 'Do stuff'},
    { name = 'Quit', action = 'q', section = 'Do stuff' },
    starter.sections.telescope(),
    starter.sections.recent_files(10, false),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing('all', { 'Builtin actions', 'Do stuff' }),
    starter.gen_hook.aligning('center', 'center'),
  },
  footer = function()
    local handle = io.popen('fortune | cowsay')
    local res = handle:read("*a")
    handle:close()
    return res
  end,
}
