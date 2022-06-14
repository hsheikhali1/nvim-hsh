local ls = require('luasnip')
local types = require('luasnip.util.types')
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/harun/plugins/luasnip/init.lua"})


-- some shorthands...
local snippet = ls.s
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require('luasnip.extras.fmt').fmt
local p = ls.parser.parse_snippet

-- Every unspecified option will be set to the default.
ls.config.set_config {
  history = true,
  -- Update more often, :h events for more info.
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
}


-- snippets
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })


vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)


ls.snippets = {
  all = {
    ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
  },
  html = {},
}

ls.add_snippets('lua', {
  ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
  ls.s("req", fmt("local {} = require('{}')", {
    f(function(req_path)
      local parts = vim.split(req_path[1][1], '.', true)
      return parts[#parts] or ''
    end, {
        1,
      }),
    i(1),
  })),
  ls.s("for", {
    t "for ",
    i(1, "k, v"),
    t " in ",
    i(2, "ipairs()"),
    t { "do", "  " },
    i(0),
    t { "", "" },
    t "end",
  }),
})

local snippets = {
  p('fn', 'function $1($2)$3 {\n  $0\n}'),
  p('afn', 'const $1 = ($2)$3 => {\n  $0\n}'),
  p('rfc', 'import React from "react"\n\n type Props = {}\n\n export const $1: React.FC<Props> = ({}) => {\n   <div>$0</div>\n}\n\n'),
  p('cl', 'console.log("$0");'),
  snippet('/**', fmt([[
  /**
   * {}
   * @param {} {} {}
   */]], {
      i(0),
      i(1, { "{type}" }),
      i(2, { "param name" }),
      i(3, { "description" }),
  })),
}

ls.add_snippets('typescript', snippets)
ls.add_snippets('typescriptreact', snippets)
ls.add_snippets('javascript', snippets)
ls.add_snippets('javascriptreact', snippets)


-- enable html snippets in jrvascript/javascript(REACT)
-- ls.snippets.javascript = ls.snippets.html
-- ls.snippets.javascriptreact = ls.snippets.html
-- ls.snippets.typescriptreact = ls.snippets.html

-- You can also use lazy loading so you only get in memory snippets of languages you use
--require('luasnip/loaders/from_vscode').lazy_load({ include = { 'html' } })
