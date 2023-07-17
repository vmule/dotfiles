local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.lazygit = {
  plugin = true,
  n = {
    -- lazygit
    ["<leader>gg"] = {"<cmd> LazyGit <CR>", "Call LazyGit"},
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>w"] = { "<cmd> NvimTreeToggle <CR>", "vmule: Toggle nvimtree" },
    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "vmule: Focus nvimtree" },
  }
}

M.general = {
  n = {
    ["aa"] = {"^", "vmule: Go to beginning of line"},
    ["ee"] = {"$", "vmule: Go to end line"},
    ["qq"] = {":q <CR>", "vmule: Quit "},
    ["ww"] = {":w! <CR>", "vmule: Write"},
  },
  i = {
    ["<C-a>"] = { "<ESC>^i", "vmule: Go to beginning of line" },
    ["<C-e>"] = { "<End>", "vmule: Got to end of line" },
  },
}

return M
