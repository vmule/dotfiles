local plugins = {
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
    config = function(_, _)
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
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
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
        "lua-language-server",
        "mypy",
        "shellcheck",
        "ruff",
        "pyright",
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
    dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }

  },
  { "lukas-reineke/indent-blankline.nvim",
    config = function()
      local blankline = require("indent_blankline")
      blankline.setup {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
    }
    end,
  },
}
return plugins
