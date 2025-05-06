local conform = require('conform')

conform.setup({
    default_format_opts = {
        lsp_format = 'fallback'
    },
    format_on_save = {
        timeout_ms = 500,
    },
})

