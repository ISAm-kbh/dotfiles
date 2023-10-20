local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local on_attach = function(_, bufnr)
end

-- for autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig['clangd'].setup({
    capabilities = capabilities,
})

lspconfig['rust_analyzer'].setup({
    capabilities = capabilities,
})

lspconfig['pyright'].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = 'openFilesOnly',
                useLibraryCodeForTypes = true,
                typeCheckingMode = 'basic',
                pythonPath = '/usr/local/bin/python3',
            },
        },
    },
})
