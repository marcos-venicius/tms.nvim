local Path = require('plenary.path')
local storage_dir = vim.fn.stdpath('data') .. '/tms/'
local current_theme_file = storage_dir .. 'current-theme'
local M = {
  configs = {
    disableThemeCycling = false
  },
  themes = {}
}

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

function M.disableThemeCycling()
  M.configs.disableThemeCycling = true
end

function M.select_next_theme()
  if #M.themes == 0 then
    vim.notify("TMS: no themes configured", vim.log.levels.WARN)
    return
  end

  local theme_index = get_current_theme()

  if theme_index > #M.themes then
    theme_index = 1
  else
    theme_index = theme_index + 1
  end

  local theme = M.themes[theme_index]

  vim.notify("using \"" .. theme .. "\" theme", vim.log.levels.INFO)

  vim.cmd.colorscheme(theme)

  save_current_theme(theme_index)
end

function M.setup(themes)
  vim.api.nvim_create_user_command("TMSNextTheme", function()
    M.select_next_theme()
  end, {})

  themes = themes or {}

  if #themes == 0 then
    return
  end

  M.themes = themes

  local theme_index = get_current_theme()
  local next_theme = theme_index

  if not M.configs.disableThemeCycling then
    if theme_index > #themes then
      theme_index = 1
    end

    next_theme = theme_index + 1
  end

  local theme = themes[theme_index]

  vim.notify('using "' .. theme .. '" theme', vim.log.levels.INFO)

  vim.cmd.colorscheme(theme)

  save_current_theme(next_theme > #themes and 1 or next_theme)
end

return M
