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
  "github_light_default",
  "moonlight",
  "material",
  "ayu-dark",
  "night-owl"
}

for _, v in ipairs(availableThemes) do
  if v == config.theme.name then
    if v == "onedark" then
      require('onedark').setup {
        style = config.theme.variant
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
      vim.g.material_style = config.theme.variant
      vim.cmd("colorscheme " .. v)
    elseif v == "ayu-dark" then
      require('ayu').setup {
        mirage = false,
        overrides = {
          bg = { bg = "#00000"},
        }
      }
      vim.cmd("colorscheme ayu-dark")
    else
      vim.cmd("colorscheme " .. v)
    end
  end
end
