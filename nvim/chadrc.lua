--@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'catppuccin'}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 M.highlights = require "custom.highlights"

local opt = vim.opt

opt.guicursor = ""

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
-- opt.backup = false
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- opt.undofile = true

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

 opt.colorcolumn = "80"

return M
