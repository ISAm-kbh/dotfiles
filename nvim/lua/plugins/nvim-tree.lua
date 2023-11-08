require("nvim-tree").setup{
    hijack_cursor = true,
    view = {
        width = 20,
    },
    modified = {
        enable = true,
    },
}

local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({"VimEnter"}, {callback = open_nvim_tree})
