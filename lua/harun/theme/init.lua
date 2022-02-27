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
  "material"
}

for _, v in ipairs(availableThemes) do
  if v == config.theme then
    if v == "onedark" then
      require('onedark').setup {
          style = 'deep'
      }
      require('onedark').load()
    elseif v == "material" then
      require('material').setup{
        italics = {
          comments = true, -- Enable italic comments
          keywords = true, -- Enable italic keywords
          functions = false, -- Enable italic functions
          strings = true, -- Enable italic strings
          variables = false -- Enable italic variables
        },
      }
      vim.g.material_style = "deep ocean"
      vim.cmd("colorscheme " .. v)
    else
      vim.cmd("colorscheme " .. v)
    end
  end
end
