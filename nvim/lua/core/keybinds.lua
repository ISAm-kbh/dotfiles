local map = vim.keymap.set

-- Move Text in Visual Modes
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Modify 'J' so cursor stays in place
map("n", "J", "mzJ`z")

-- Paging Up and Down keeps cursor in middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Searching Stays in middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Delete Highlighted word into void register, and then paste
map("x", "<leader>p", "\"_dP")

-- Yank into system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

-- Delete to Void Register
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- Replace all instances of current word
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Buffer Navigation
map("n", "<leader>bn", ":bn<CR>")
map("n", "<leader>bp", ":bp<CR>")
map("n", "<leader>b", ":b")

-- View Code Action
map('n', '<leader>ca', function() require('lspsaga').code_action() end)

-- Toggle Nvim Tree
map('n', '<leader>tt', ':NvimTreeToggle<CR>')
-- Nvim Lint
map('n', '<leader>l', function() require('lint').try_lint() end)

-- Nvim DAP
local dap = require('dap')
map('n', '<leader>dc', function() dap.continue() end)
map('n', '<leader>dso', function() dap.step_over() end)
map('n', '<leader>dsi', function() dap.step_into() end)
map('n', '<leader>dsu', function() dap.step_out() end)
map('n', '<leader>db', function() dap.toggle_breakpoint() end)
