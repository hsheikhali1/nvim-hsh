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
  "night-owl",
  "nightfly",
  "dracula",
  "lighthaus_dark",
  "vscode",
  "onedarkpro"
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
    elseif v == "onedarkpro" then
      require("onedarkpro").setup({
        theme = "onedark_dark",
        styles = { -- Choose from "bold,italic,underline"
            strings = "NONE", -- Style that is applied to strings.
            comments = "NONE", -- Style that is applied to comments
            keywords = "NONE", -- Style that is applied to keywords
            functions = "italic", -- Style that is applied to functions
            variables = "italic", -- Style that is applied to variables
            virtual_text = "NONE", -- Style that is applied to virtual text
        },
        options = {
            bold = false, -- Use the themes opinionated bold styles?
            italic = false, -- Use the themes opinionated italic styles?
            underline = false, -- Use the themes opinionated underline styles?
            undercurl = false, -- Use the themes opinionated undercurl styles?
            cursorline = false, -- Use cursorline highlighting?
            transparency = false, -- Use a transparent background?
            terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
            window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
        }
      })
      vim.cmd("colorscheme onedarkpro")
    else
      vim.cmd("colorscheme " .. v)
    end
  end
end
