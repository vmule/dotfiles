--@type ChadrcConfig 
 local M = {}

 M.ui = {
  theme = 'catppuccin',

  telescope = {
    style = "bordered"
  }, -- borderless / bordered

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
  },
}

 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 M.highlights = require "custom.highlights"

vim.opt.guicursor = ""
vim.opt.mouse = "a"
vim.opt.nu = true
vim.opt.paste = true

vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.clipboard = "unnamed"

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.wrap = true

vim. opt.swapfile = false

vim.opt.hlsearch =true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

return M
