-- Harun's config
-- Friday Dec 24, 2021

pcall(require, "impatient")

if require "harun.first_load"() then
  return
end

require("harun.plugins")

require("harun.mappings")

require("harun.settings")

