local harpoon = require('harpoon')
local harpoon_extensions = require('harpoon.extensions')
local map = vim.keymap.set

harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- Add Buffers and pull up the menu
map('n', '<leader>a', function() harpoon:list():add() end)
map('n', '<leader>b', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

-- Shortcut buffers
map('n', '<leader>q', function() harpoon:list():select(1) end)
map('n', '<leader>w', function() harpoon:list():select(2) end)
map('n', '<leader>e', function() harpoon:list():select(3) end)
map('n', '<leader>r', function() harpoon:list():select(4) end)

-- Go forward and backwards through buffers
map('n', '<C-o>', function() harpoon:list():prev() end)
map('n', '<C-b>', function() harpoon:list():next() end)
