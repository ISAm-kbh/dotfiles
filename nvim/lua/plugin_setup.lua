local call = vim.call
local cmd = vim.cmd
local Plug = vim.fn['plug#']
local PATH = "~/.vim/autoload"

call('plug#begin', PATH)
    -- Polyglot for syntax highlight
    -- Plug 'sheerun/vim-polyglot'
    -- Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'

    -- Everforest theme
    Plug 'sainnhe/everforest'

    -- Powerline wisual plugin for Neovim
    -- Plug 'vim-airline/vim-airline'
    Plug 'nvim-lualine/lualine.nvim'

    -- File Tree
    Plug 'nvim-tree/nvim-tree.lua'

    -- Dev icons for Nvim-Tree
    Plug 'nvim-tree/nvim-web-devicons'

    -- Telescope fzf
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    -- Harpoon
    Plug 'theprimeagen/harpoon'

    --Powerline style for tmux that coordinates with Neovim and syncs the Everforest theme
    Plug 'edkolev/tmuxline.vim'

    -- Lazygit
    Plug 'kdheepak/lazygit.nvim'

    -- Autopairs
    Plug 'windwp/nvim-autopairs'

    -- Autocompletion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'

    -- Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'

    -- Managing & installing LSP
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    -- configure LSP servers
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'onsails/lspkind.nvim'

    -- Linting
    Plug 'mfussenegger/nvim-lint'

    -- Debugging
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'

call 'plug#end'
