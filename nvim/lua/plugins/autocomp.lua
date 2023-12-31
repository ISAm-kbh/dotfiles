local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
    return
end
local autopairs_status, autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not autopairs_status then
    return
end

local lspkind = require('lspkind')

-- load friendly snippets
require("luasnip/loaders/from_vscode").lazy_load()
luasnip.filetype_extend('htmldjango', {'html'})

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),--previous suggestion
        ['<C-n>'] = cmp.mapping.select_next_item(),--next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),--show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),--fill completion
    }),
    sources = cmp.config.sources({
            { name = 'nvim_lsp'}, --lsp
            { name = 'luasnip'},--snippets
            { name = 'buffer'},--text within current buffer
            { name = 'path'},--file system paths
    }),
    formatting  ={
        format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = '...'
        }),
    }
})

cmp.event:on(
    'confirm_done',
    autopairs.on_confirm_done()
)
