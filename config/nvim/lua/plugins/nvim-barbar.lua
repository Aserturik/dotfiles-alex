return {
    "romgrk/barbar.nvim",
    init = function() vim.g.barbar_auto_setup = false end,
    lazy = false,
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function()
        require("barbar").setup({
            animation = false,
            auto_hide = 0,
            sidebar_filetypes = {
                NvimTree = true,
                ["neo-tree"] = { event = "BufWipeout" },
            },
            icons = {
                filetype = {
                    custom_icons = false,
                },
                pinned = { button = "", filename = true },
            },
        })
    end,
}
