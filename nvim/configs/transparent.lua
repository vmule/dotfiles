require("transparent").setup({
-- table: default groups
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
-- table: additional groups that should be cleared
  extra_groups = {}, -- table: additional groups that should be cleared
-- table: groups you don't want to clear
  exclude_groups = {
    'StatusLine',
  }, -- table: groups you don't want to clear
})
