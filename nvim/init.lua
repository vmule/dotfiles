-- Silence deprecation warnings in Neovim 0.11/0.12 until plugins update
local original_deprecate = vim.deprecate
vim.deprecate = function(name, alternative, version, plugin, backtrace)
  local silent_patterns = {
    "supports_method",
    "lspconfig",
    "lsp.with",
    "sign_define",
    "get_active_clients",
  }
  for _, pattern in ipairs(silent_patterns) do
    if name:find(pattern) or (alternative and alternative:find(pattern)) then
      return
    end
  end
  return original_deprecate(name, alternative, version, plugin, backtrace)
end

vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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

vim.opt.swapfile = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
