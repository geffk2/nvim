local compileC = function()
  if vim.bo.filetype == 'c' then
    require 'cmp'.close()
    local fileName = vim.fn.fnamemodify(vim.fn.expand('%'), ':t:r')
    local dir = vim.fn.fnamemodify(vim.fn.expand('%'), ':p:h')
    vim.cmd('silent exec "!' .. 'gcc -g -o ' .. fileName .. ' ' .. fileName .. '.c"')
    vim.cmd('silent exec "!tmux popup -d ' .. dir .. ' ' .. dir .. '//' .. fileName .. '"')
  end
end

vim.api.nvim_create_user_command('Compile', compileC, {})

