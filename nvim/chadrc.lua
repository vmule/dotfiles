--@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'catppuccin',

  cmp = {
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "white_fg", -- only applicable for "default" style, use color names from base30 variables
  },

  telescope = { style = "bordered" }, -- borderless / bordered

  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
  },
}

 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 M.highlights = require "custom.highlights"

local opt = vim.opt

opt.guicursor = ""
opt.mouse = "a"

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.clipboard = "unnamed"

opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"

 opt.swapfile = false

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50

 opt.colorcolumn = "80"

return M
