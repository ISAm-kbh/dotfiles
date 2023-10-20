local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

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
})
