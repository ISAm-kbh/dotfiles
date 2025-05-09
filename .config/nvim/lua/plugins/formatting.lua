local conform = require('conform')

conform.setup({
    formatters_by_ft = {
        php = { 'pint' },
        blade = { 'blade-formatter' },
    },
    default_format_opts = {
        lsp_format = 'fallback'
    },
    format_on_save = {
        timeout_ms = 500,
    },
})

