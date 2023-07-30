--@type ChadrcConfig

 local M = {}

M.highlights = require "custom.highlights"
M.mappings = require "custom.mappings"
M.plugins = "custom.plugins"

 M.ui = {
  theme = 'catppuccin',
  transparency = false,

  telescope = {
    style = "bordered",
    -- borderless / bordered
  },

  statusline = {
    theme = "vscode_colored",
    -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
  },
}

vim.g.mapleader = ' '

vim.api.nvim_set_hl(0, "Comment", { fg = "#f0efe9", italic = true, })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#abe9b3", bold = true, })
vim.api.nvim_set_hl(0, "St_gitIcons", { fg = "#abe9b3", })
vim.api.nvim_set_hl(0, "StText", { fg = "white", italic = true})

vim.opt.guicursor = ""
vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.copyindent = true

vim.opt.clipboard = "unnamed"

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append "trail:-"
-- vim.opt.listchars:append "nbsp:+"

vim.opt.wrap = true

vim. opt.swapfile = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

return M
