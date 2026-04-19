local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
    "bashls",
    -- "clangd",
    "dockerls",
    "jsonls",
    "jsonnet_ls",
    "pyright",
    "ruff",
    "yamlls",
}

for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        capabilities = capabilities,
    })
    vim.lsp.enable(lsp)
end

vim.lsp.config("clangd", {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
})
vim.lsp.enable("clangd")

vim.lsp.config("gopls", {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})
vim.lsp.enable("gopls")

vim.lsp.config("rust_analyzer", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
})
vim.lsp.enable("rust_analyzer")
