-- Harun's config
-- Tuesday Dec 21, 2021

vim.g.mapleader = ","

pcall(require, "impatient")

if require "harun.first_load"() then
  return
end

require "harun.plugins"

require "harun.mappings"

require "harun.settings"

require "harun.config"
