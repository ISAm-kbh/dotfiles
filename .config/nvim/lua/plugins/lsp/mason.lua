local mason_status, mason =pcall(require, 'mason')
if not mason_status then
    return
end

local mason_lsp_config_status, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lsp_config_status then
    return
end
mason.setup()

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "marksman",
        'rust_analyzer',
        'pyright',
        'intelephense',
    }
})

require("lspconfig").clangd.setup {}
