local config = require("harun.config")

local availableThemes = {
  "everforest",
  "codesmell_dark",
  "moonfly",
  "kanagawa",
  "nightfox",
  "nordfox",
  "dayfox",
  "dawnfox"
}

for _, v in ipairs(availableThemes) do
  if v == config.theme then
    vim.cmd("colorscheme " .. v)
  end
end
