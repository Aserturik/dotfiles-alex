return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = { "bashls", "lua_ls", "cssls", "astro", "biome", "html", "tailwindcss", "ast_grep", "yamlls", "sqlls" },
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.biome.setup({
                capabilities = capabilities,
            })
            lspconfig.sqlls.setup({
                cmd = { "sql-language-server", "up", "--method", "stdio" },
                filetypes = { "sql", "mysql" },
                root_dir = require('lspconfig.util').root_pattern(".git", vim.fn.getcwd()),
            })
            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.astro.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.ast_grep.setup({
                capabilities = capabilities,
            })
            lspconfig.yamlls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Declaration" })
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Definitions" })
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "References" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format your code" })
        end,
    },
}
