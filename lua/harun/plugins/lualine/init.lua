local config = require('harun.config')

local function current_buffer_number()
  return "﬘ " .. vim.api.nvim_get_current_buf()
end

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

local function current_date()
  return string.sub(os.date "%x", 1, 5)
end

local function current_working_dir()
  local cwd = string.sub(vim.fn.getcwd(), 12)
  return "~" .. cwd
end

-- need to add this for solarized colors
if config.theme.name == "solarized8" then
  config.theme.name = "solarized_dark"
end

if config.theme.name == "solarized8_high" then
  config.theme.name = "solarized_dark"
end

if config.theme.name == "solarized8_flat" then
  config.theme.name = "solarized_dark"
end

if config.theme.name == "github_dark_default" then
  config.theme.name = "github"
end

if config.theme.name == "github_light_default" then
  config.theme.name = "github"
end

if config.theme.name == "ayu-dark" then
  config.theme.name = "ayu"
end

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = config.theme.name,
    component_separators = { left = "⦚", right = "  " },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "b:gitsigns_head", icon = "" },
      { "diff", source = diff_source },
      { "diagnostics", sources = { "nvim_diagnostic" } },
    },
    lualine_c = { { "filename", path = 1, symbols = { modified = "[]", readonly = " " } } },
    lualine_x = { { "filetype", icon_only = true } },
    lualine_y = { { current_buffer_number }, { current_working_dir }, { current_date } },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { "filename", path = 1, symbols = { modified = "[]", readonly = " " } } },
    lualine_x = { "location" },
    lualine_y = { { current_buffer_number } },
    lualine_z = {},
  },
  extensions = {},
}
