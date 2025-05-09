require('lualine').setup {
    options = {
        theme = 'gruvbox-material',
        globalstatus = true,
    },
    sections = {
        lualine_b = {
            {
                'branch',
                draw_empty = true,
            },
             'diff',
            {
                'diagnostics',
                sources = {'nvim_diagnostic', 'nvim_lsp'},
                sections = {'error', 'warn'},
            }
        },
        lualine_x = {'filetype'},
        lualine_y = {
            'encoding',
            {
                'fileformat',
                separator = {left = '█'}
            }
        },
        lualine_z = {
            'progress',
            {
                'location',
                separator = {left = '█'}
            }
        }
    },
    inactive_sections = {
        lualine_x = {},
        lualine_z = {'location'},
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                mode = 4
            }
        },
        lualine_z = {'tabs'}
    },
    extensions = {'nvim-tree'}
}
