local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
	},
}

M.dap_python = {
	plugin = true,
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
		},
	},
}

M.dap_go = {
	plugin = true,
	n = {
		["<leader>dgt"] = {
			function()
				require("dap-go").debug_test()
			end,
			"Debug go test",
		},
		["<leader>dgl"] = {
			function()
				require("dap-go").debug_last()
			end,
			"Debug last go test",
		},
	},
}

M.gopher = {
	plugin = true,
	n = {
		["<leader>gsj"] = {
			"<cmd> GoTagAdd json <CR>",
			"Add json struct tags",
		},
		["<leader>gsy"] = {
			"<cmd> GoTagAdd yaml <CR>",
			"Add yaml struct tags",
		},
	},
}

M.lazygit = {
	plugin = true,
	n = {
		-- lazygit
		["<leader>gg"] = { "<cmd> LazyGit <CR>", "Call LazyGit" },
	},
}

M.nvimtree = {
	plugin = true,

	n = {
		-- toggle
		["<leader>w"] = { "<cmd> NvimTreeToggle <CR>", "vmule: Toggle nvimtree" },
		-- focus
		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "vmule: Focus nvimtree" },
	},
}

M.general = {
	n = {
		["<C-a>"] = { "<ESC>^i", "vmule: Go to beginning of line" },
		["<C-e>"] = { "<End>", "vmule: Got to end of line" },
		["qq"] = { ":q <CR>", "vmule: Quit " },
		["ww"] = { ":w! <CR>", "vmule: Write" },
		["tt"] = { "<cmd>TransparentToggle<CR>", "Toggle Transparent" },
	},
	i = {
		["<C-a>"] = { "<ESC>^i", "vmule: Go to beginning of line" },
		["<C-e>"] = { "<End>", "vmule: Got to end of line" },
	},
}

return M
