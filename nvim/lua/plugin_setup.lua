local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
    },

    -- Gruvbox theme
    'sainnhe/gruvbox-material',

    -- Powerline visual plugin for Neovim
    -- 'vim-airline/vim-airline',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
    },

    -- File Tree
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {'nvim-tree/nvim-web-devicons'},
    },

    -- Dev icons for Nvim-Tree
    'nvim-tree/nvim-web-devicons',

    -- Telescope fzf
    {
        'nvim-telescope/telescope.nvim', tag='0.1.4',
        dependencies = {'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

    -- Navigation between vim & tmux
    {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    },

    -- Harpoon
    {
        'theprimeagen/harpoon',
        dependencies = {'nvim-lua/plenary.nvim'},
    },

    -- Lazygit
    {
        'kdheepak/lazygit.nvim',
        dependencies = {'nvim-lua/plenary.nvim'},
    },

    -- Autopairs
    'windwp/nvim-autopairs',

    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',

    -- Managing & installing LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- configure LSP servers
    'neovim/nvim-lspconfig',
    'nvimdev/lspsaga.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind.nvim',

    -- Linting
    'mfussenegger/nvim-lint',

    -- Formatting
    {
        'stevearc/conform.nvim',
        event = { 'BufWritePre' },
        cmd = { 'ConformInfo' },
    },

    -- Debugging
    'mfussenegger/nvim-dap',
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {'mfussenegger/nvim-dap'},
    },
}

local opts = {}

require('lazy').setup(plugins, opts)
