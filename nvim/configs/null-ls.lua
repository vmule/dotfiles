local null_ls = require('null-ls')
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    -- python formatter and diag
    --
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,

    -- bash formatter and diag
    null_ls.builtins.diagnostics.shellcheck,
    null_ls.builtins.formatting.shfmt,

    -- go formatter and diag
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports_reviser,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.gopls,

    -- lua formatter
    null_ls.builtins.formatting.luaformatter,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, })
        end,
      })
    end
  end,
}

return opts
