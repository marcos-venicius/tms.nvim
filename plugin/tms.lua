local Path = require('plenary.path')
local storage_dir = vim.fn.stdpath('data') .. '/tms/'
local current_theme_file = storage_dir .. 'current-theme'

local path = Path:new(storage_dir)

if not path:exists() then
  path:mkdir({ parents = true })

  path = Path:new(current_theme_file)

  path:write('1', 'w')
end

