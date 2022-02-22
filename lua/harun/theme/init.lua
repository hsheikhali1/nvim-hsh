local config = require("harun.config")

local availableThemes = {
  "everforest",
  "codesmell_dark",
  "moonfly",
  "kanagawa",
  "nightfox",
  "nordfox",
  "dayfox",
  "dawnfox",
  "solarized8",
  "solarized8_high",
  "solarized8_flat",
  "rigel",
  "PaperColor",
  "onedark",
  "github_dark_default",
  "moonlight",
}

for _, v in ipairs(availableThemes) do
  if v == config.theme then
    if v == "onedark" then
      require('onedark').setup {
          style = 'deep'
      }
      require('onedark').load()
    else
      vim.cmd("colorscheme " .. v)
    end
  end
end
