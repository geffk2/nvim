local lualine = require 'lualine'
local tabline = require 'tabline'


local buffer = {
  tabline.tabline_buffers,
  separator = { left = "", right = "" },
}

local modes = {
  'mode', fmt = function(str) return str:sub(1, 1) end,
  separator = { left = "", right = "" },
}
local space = {
  function()
    return " "
  end,
  color = { bg = '#2b2d37'}
}

local vim_icons = {
  function()
    return "λ"
  end,
  separator = { left = "", right = "" },
  color = { bg = "#404455", fg = "#6cb6eb" },
}


local branch = {
  'branch',
  color = { bg = "#a0c980", fg = "#2b2d37", gui='bold'},
  separator = { left = "", right = "" },
}
local diff = {
  "diff",
  color = { bg = "#404455", fg = "#404455" },
  separator = { left = "", right = "" },
}

local function getLspName()
	local msg = 'No Active Lsp'
	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return "  " .. client.name
		end
	end
	return "  " .. msg
end

local dia = {
  'diagnostics',
  color = { bg = "#404455", fg = "#404455" },
  separator = { left = "", right = "" },
}

local lsp = {
  function()
    return getLspName()
  end,
  separator = { left = "", right = "" },
  color = { bg = "#6cb6eb", fg = "#2b2d37", gui='bold'},
}

local fileformat = {
	'fileformat',
	color = { bg = "#6cb6eb", fg = "#2b2d37" },
	separator = { left = "", right = "" },
}

local encoding = {
	'encoding',
	color = { bg = "#404455", fg = "#6cb6eb" },
	separator = { left = "", right = "" },
}

local filetype = {
  'filetype',
  colored = false,
  color = { bg = "#404455", fg = "#a0c980" },
  separator = { left = "", right = "" },
}

local location = {
  'location',
  color = { bg = "#a0c980", fg = "#2b2d37", gui='bold'},
  separator = { left = "", right = "" },
}



lualine.setup {
  extensions = {
    'nvim-tree',
  },
  options = {
    theme = 'edge',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    -- lualine_a = {{ 'mode', fmt = function() return 'λ' end, gui = 'bold'}},
    lualine_a = { modes, vim_icons},
    lualine_b = { space, branch, diff },
    lualine_c = { space, lsp, dia},
    lualine_x = { encoding, fileformat, },
    lualine_y = { space, filetype, location},
    lualine_z = {}
  },
  tabline = {
    lualine_b = { buffer }
  }
}
