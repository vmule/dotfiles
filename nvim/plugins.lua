local plugins = {

  {
    "folke/lazy.nvim", version = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "dreamsofcode-io/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "bash",
        "go",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "rust",
        "vim",
        "yaml",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "black",
        "clangd",
        "debugpy",
        "dockerfile-language-server",
        "golangci-lint",
        "gospel",
        "lua-language-server",
        "mypy",
        "pyright",
        "ruff",
        "rust-analyzer",
        "shellcheck",
        "yaml-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- opts = {},
    event = "VeryLazy",
    config = function()
      require ("core.utils").load_mappings("lazygit")
    end,
    -- optional for floating window border decoration
    dependencies = {
    "nvim-lua/plenary.nvim",
    },
  },
  {
    "folke/noice.nvim",
    config = function()
      require "custom.configs.noice"
    end,
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function ()
      require "custom.configs.nvim-tree"
    end,
  event = "VeryLazy",
  opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local blankline = require("indent_blankline")
      blankline.setup {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require('notify').setup ({
        background_colour = "#000000"
      })
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require "custom.configs.transparent"
    end,
    opts = {},
    lazy = false,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
return plugins
