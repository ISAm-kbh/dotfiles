local lint = require('lint')
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

lint.linters_by_ft = {
    python = {'pylint'}
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    callback = function()
        require('lint').try_lint()
    end,
})
