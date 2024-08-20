local Path = require('plenary.path')
local storage_dir = vim.fn.stdpath('data') .. '/tms/'
local current_theme_file = storage_dir .. 'current-theme'
local M = {}

local function get_current_theme()
  local path = Path:new(current_theme_file)

  local content = path:read()

  if content and #content > 0 then
    return tonumber(content)
  end

  return 1
end

local function save_current_theme(theme)
  local path = Path:new(current_theme_file)

  path:write(tostring(theme), 'w')
end

function M.setup(themes)
  themes = themes or {}

  if #themes == 0 then
    return
  end

  local theme_index = get_current_theme()

  if theme_index > #themes then
    theme_index = 1
  end

  local theme = themes[theme_index]
  local next_theme = theme_index + 1

  print("using \"" .. theme .. "\" theme")

  vim.cmd.colorscheme(theme)

  save_current_theme(next_theme > #themes and 1 or next_theme)
end

return M
