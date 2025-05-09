local opt = vim.opt

opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.backspace = "indent,eol,start"
opt.ttyfast = true
opt.clipboard:append('unnamedplus')
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.background = 'dark'
opt.scrolloff = 8
opt.incsearch = true

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
